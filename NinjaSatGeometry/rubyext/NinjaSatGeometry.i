%module NinjaSatGeometry
%{
#include "NinjaSatMainGeometry.hh"

#include "class_list_anlGeant4.hh"

using namespace ninjasatgeometry;

%}

%import(module="anlgeant4/anlGeant4") "anlGeant4.i"

namespace ninjasatgeometry {

class NinjaSatMainGeometry : public anlgeant4::VANLGeometry {
public:
  NinjaSatMainGeometry();
  virtual ~NinjaSatMainGeometry();
};

}
