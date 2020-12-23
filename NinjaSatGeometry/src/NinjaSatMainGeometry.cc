#include "NinjaSatMainGeometry.hh"
#include "DetectorConstruction.hh"

namespace ninjasatgeometry
{

G4VUserDetectorConstruction* NinjaSatMainGeometry::create()
{
  G4VUserDetectorConstruction* theGeometry = new DetectorConstruction;
  return theGeometry;
}

} /* namespace ninjasatgeometry */
