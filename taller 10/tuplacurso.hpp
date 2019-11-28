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
  tupla_curso(std::string cod, std::string nom, std::string nom_u, int cre, int num_g);
  ~tupla_curso();
  string obtener_curso_cod();
  string obtener_nombre();
  string obtener_nombre_unid();
  int obtener_creditos();
  int obtener_num_grupos();
  void imprimirTupla();
  void write(std::ostream& f);
  void read(std::istream& f);
};

#include "tuplacurso.cpp"
#endif //_tuplacurso_hpp_
