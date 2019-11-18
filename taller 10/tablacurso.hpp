#ifndef _tablacurso_hpp_
#define _tablacurso_hpp_

using namespace std;

#include <iostream>
#include <string>
#include <list>
#include "tuplacurso.hpp"

class tabla_curso {
private:
  std::list <tupla_curso> tuplas;
  std::string nombre;
  std::string PK = "curso_cod";
public:
  tabla_curso();
  ~tabla_curso();
  bool agregar();
  bool encontrar();
  bool eliminar();
};

#include "tablacurso.cpp"
#endif //_tablacurso_hpp_
