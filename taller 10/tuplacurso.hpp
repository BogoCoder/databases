#ifndef _tuplacurso_hpp_
#define _tuplacurso_hpp_

using namespace std;

#include <iostream>
#include <string>

class tupla_curso {
private:
	std::string curso_cod;
	std::string nombre;
	std::string nombre_unid;
  int creditos;
  int num_grupos;

public:
  tupla_curso();
  ~tupla_curso();
};

#include "tuplacurso.cpp"
#endif //_tuplacurso_hpp_
