#ifndef NINJASATGEOMETRY_SGDMainGeometry_H
#define NINJASATGEOMETRY_SGDMainGeometry_H 1

#include "VANLGeometry.hh"

class G4VUserDetectorConstruction;

namespace ninjasatgeometry {

class NinjaSatMainGeometry : public anlgeant4::VANLGeometry
{
  DEFINE_ANL_MODULE(NinjaSatMainGeometry, 1.0);

public:
  NinjaSatMainGeometry() = default;
  virtual ~NinjaSatMainGeometry() = default;

  G4VUserDetectorConstruction* create() override;
};

} /* namespace ninjasatgeometry */

#endif /* NINJASATGEOMETRY_SGDMainGeometry_H */
