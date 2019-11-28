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
  tabla_curso(string nombre, list <tupla_curso> tuplas);
  ~tabla_curso();
  bool agregar(tupla_curso tupla);
  bool encontrar(tupla_curso tupla);
  bool eliminar(tupla_curso tupla);
  void imprimirTabla();
  void guardarTabla();
  void leerTabla();
};

#include "tablacurso.cpp"
#endif //_tablacurso_hpp_
