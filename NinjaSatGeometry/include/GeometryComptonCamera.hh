#ifndef SGDGEOMETRY_GeometryComptonCamera_HH
#define SGDGEOMETRY_GeometryComptonCamera_HH

#include "globals.hh"

class G4LogicalVolume;
class G4VPhysicalVolume;

namespace sgdgeometry {

class GeometryComptonCamera {

public:
  GeometryComptonCamera() {}
  virtual ~GeometryComptonCamera() {}

  G4LogicalVolume* Construct();

private:
  void DefineMaterials() {};
  void SetupGeometry() {};

};

}

#endif

