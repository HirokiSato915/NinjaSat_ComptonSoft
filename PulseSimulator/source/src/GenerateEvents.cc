#include "GenerateEvents.hh"
#include <cmath>
#include "TRandom3.h"
#include "TH1.h"
#include "AstroUnits.hh"
#include "InitialInformation.hh"
#include "DetectorHit.hh"
#include "CSHitCollection.hh"

using namespace anlnext;

namespace unit = anlgeant4::unit;

namespace ninjasat
{

GenerateEvents::GenerateEvents() :
  origin_(0.0, 0.0, 0.0),
  inner_radius_(2.0*unit::cm),
  outer_radius_(4.0*unit::cm),
  drift_velocity_(1.0*unit::cm/unit::us),
  diffusion_coefficient_((0.01*unit::cm)*(0.01*unit::cm)/unit::us),
  num_bins_(64),
  t0_(0.0),
  t1_(10.0),
  random_(new TRandom3)
{
}

ANLStatus GenerateEvents::mod_define()
{
  define_parameter("origin", &mod_class::origin_, unit::cm, "cm");
  define_parameter("inner_radius", &mod_class::inner_radius_, unit::cm, "cm");
  define_parameter("outer_radius", &mod_class::outer_radius_, unit::cm, "cm");
  define_parameter("drift_velocity", &mod_class::drift_velocity_, unit::cm/unit::s, "cm/s");
  define_parameter("diffusion_coefficient_", &mod_class::diffusion_coefficient_, unit::cm*unit::cm/unit::s, "cm2/s");
  define_parameter("num_bins", &mod_class::num_bins_);
  define_parameter("t0", &mod_class::t0_, 1.0, "us");
  define_parameter("t1", &mod_class::t1_, 1.0, "us");

  return AS_OK;
}

ANLStatus GenerateEvents::mod_initialize()
{
  comptonsoft::VCSModule::mod_initialize();
  get_module("CSHitCollection", &hit_collection_);
  get_module_IF("InitialInformation", &initial_info_);

  mkdir();
  inner_pulse_ = new TH1D("i_base", "Inner pulse", num_bins_, t0_, t1_);
  outer_pulse_ = new TH1D("o_base", "Outer pulse", num_bins_, t0_, t1_);
  
  return AS_OK;
}

ANLStatus GenerateEvents::mod_analyze()
{
  const std::vector<comptonsoft::DetectorHit_sptr>& hits = hit_collection_->getHits();
  if (hits.size() == 0) { return AS_OK; }

  const int event_id = initial_info_->EventID();
  const std::string inner_name = (boost::format("i_%06d") % event_id).str();
  const std::string outer_name = (boost::format("o_%06d") % event_id).str();
  inner_pulse_ = static_cast<TH1*>(inner_pulse_->Clone(inner_name.c_str()));
  outer_pulse_ = static_cast<TH1*>(outer_pulse_->Clone(outer_name.c_str()));
  inner_pulse_->Reset();
  outer_pulse_->Reset();
  
  simulatePulse(hits);
  
  return AS_OK;
}

void GenerateEvents::simulatePulse(const std::vector<comptonsoft::DetectorHit_sptr>& hits)
{
  constexpr int n_split = 1000;
  for (auto& hit: hits) {
    const double edep = hit->EnergyDeposit()/n_split;
    const comptonsoft::vector3_t position = hit->RealPosition() - origin_;
    const double drift_time = std::abs(position.z())/drift_velocity_;
    const double diffusion_sigma = std::sqrt(2*diffusion_coefficient_*drift_time);

    for (int i=0; i<n_split; i++) {
      const double dx = random_->Gaus(0.0, diffusion_sigma);
      const double dy = random_->Gaus(0.0, diffusion_sigma);
      const double dz = random_->Gaus(0.0, diffusion_sigma);
      const double x = position.x() + dx;
      const double y = position.y() + dy;
      const double z = position.z() + dz;
      const double t = z/drift_velocity_;
      const double r = std::sqrt(x*x+y*y);
      if (r < inner_radius_) {
        inner_pulse_->Fill(t/unit::us, edep/unit::keV);
      }
      else if (r < outer_radius_) {
        outer_pulse_->Fill(t/unit::us, edep/unit::keV);
      }
    }
  }
}

} /* namespace ninjast */
