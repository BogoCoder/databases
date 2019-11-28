#include <iostream>
#include "tablacurso.hpp"
using namespace std;

int main()
{
    cout << "Pruebas:" << endl;
    tupla_curso tuplita1("001", "proba", "macc", 3, 1);
    tupla_curso tuplita2("002", "esta", "macc", 2, 1);
    tupla_curso tuplita3("003", "opti", "macc", 3, 1);
    
    list<tupla_curso> tuplitas;
    tuplitas.push_front(tuplita1);
    tuplitas.push_front(tuplita2);
    tuplitas.push_front(tuplita3);
    tabla_curso tablita("tabla_cursos", tuplitas);

    tablita.guardarTabla();
    tablita.leerTabla();
    tablita.imprimirTabla();
}