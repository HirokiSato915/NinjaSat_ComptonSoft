%module ninjaSatPulseSimulator
%{
#include "class_list_anlGeant4.hh"
#include "class_list_comptonSoft.hh"

// include headers of my modules
#include "GenerateEvents.hh"

%}

%import(module="comptonsoft/comptonSoft") "comptonsoft/ruby/comptonSoft.i"

// interface to my modules

namespace ninjasat {

class GenerateEvents : public comptonsoft::VCSModule {};

} /* namespace ninjasat */
