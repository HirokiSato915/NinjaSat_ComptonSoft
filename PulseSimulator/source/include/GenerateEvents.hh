/**
 * GenerateEvents.
 * This module generates an event with pulse shape
 *
 * @author Hirokazu Odaka
 * @date 2021-01-06
 *
 */

#ifndef NINJASAT_GenerateEvents_H
#define NINJASAT_GenerateEvents_H 1

#include "VCSModule.hh"
#include <memory>
#include "TRandom.h"
#include "CSTypes.hh"
#include "DetectorHit_sptr.hh"

namespace comptonsoft {
class CSHitCollection;
}

namespace anlgeant4 {
class InitialInformation;
}

class TH1;


namespace ninjasat
{

class GenerateEvents : public comptonsoft::VCSModule
{
  DEFINE_ANL_MODULE(GenerateEvents, 1.0);
public:
  GenerateEvents();
  
  anlnext::ANLStatus mod_define() override;
  anlnext::ANLStatus mod_initialize() override;
  anlnext::ANLStatus mod_analyze() override;

private:
  void simulatePulse(const std::vector<comptonsoft::DetectorHit_sptr>& hits);

private:
  comptonsoft::vector3_t origin_;
  double inner_radius_;
  double outer_radius_;
  double drift_velocity_;
  double diffusion_coefficient_;
  int num_bins_;
  double t0_;
  double t1_;

  std::unique_ptr<TRandom> random_;
  const comptonsoft::CSHitCollection* hit_collection_ = nullptr;
  const anlgeant4::InitialInformation* initial_info_ = nullptr;
  TH1* inner_pulse_ = nullptr;
  TH1* outer_pulse_ = nullptr;
};

} /* namespace ninjasat */

#endif /* NINJASAT_GenerateEvents_H */
