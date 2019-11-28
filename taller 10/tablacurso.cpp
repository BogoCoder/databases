#ifndef _tablacurso_cpp_
#define _tablacurso_cpp_

#include "tablacurso.hpp"
#include <fstream>

tabla_curso::tabla_curso(){
    nombre = "";
    std::list <tupla_curso> tuplas;
}

tabla_curso::tabla_curso(string nombre, list <tupla_curso> tuplas){
    nombre = nombre;
    tuplas = tuplas;
}

tabla_curso::~tabla_curso(){
    nombre = "";
    tuplas.clear();
}

bool tabla_curso::agregar(tupla_curso tupla){
    tuplas.push_front(tupla);
    return true;
}

bool tabla_curso::encontrar(tupla_curso tupla){
    string curso_cod = tupla.obtener_curso_cod();
    for (auto &i: this->tuplas) {
        if(tupla.obtener_curso_cod() == i.obtener_curso_cod()){
            cout << "La tupla se encuentra en la tabla, su primary key es: " << curso_cod << endl;
        }
    }
    return true;
}

bool tabla_curso::eliminar(tupla_curso tupla){
    string curso_cod = tupla.obtener_curso_cod();
    auto it1 = tuplas.begin(); 
    for (auto &i: this->tuplas) {
        it1++;
        if(tupla.obtener_curso_cod() == i.obtener_curso_cod()){
            tuplas.erase(it1);
            cout << "La tupla se ha eliminado de la tabla, su primary key es: " << curso_cod << endl;
        }
    }
    return true;
}

void tabla_curso::imprimirTabla(){
    cout << "hola" + tuplas.size();
        for (auto it = tuplas.begin(); it != tuplas.end(); ++it) {
            cout<< "hola";
            (*it).imprimirTupla();
        }
}

void tabla_curso::guardarTabla(){
    std::ofstream wf("tablacurso.dat", std::ios::out | std::ios::binary);
    if(!wf) {
        std::cout << "¡No se puede abrir el archivo!" << std::endl;
    }

    for (auto &i: this->tuplas) {
        i.write(wf);
    }

    wf.close();

    if(!wf.good()) {
        std::cout << "Error occurred at writing time!" << std::endl;
    }
    std::cout << "Archivo escrito exitosamente" << std::endl;
}


void tabla_curso::leerTabla(){
   std::ifstream rf("tablacurso.dat", std::ios::in | std::ios::binary);
   if(!rf) {
	   std::cout << "No se puede abrir el archivo!" << std::endl;
   }

   std::cout << "Archivo de lectura abierto exitosamente" << std::endl;

    int size = tuplas.size();
    tuplas.clear();
    tupla_curso arr[size];
    for(int i = 0; i < size; i++){
        arr[i] = tupla_curso();
        arr[i].read(rf);
    }
   	for (auto i: arr) {
		tuplas.push_front(i);
	}
    rf.close();

    std::cout << "Archivo de lectura cargado exitosamente" << std::endl;
    if(!rf.good()) {
        std::cout << "Error occurred at reading time!" << std::endl;
    }
}


#endif //_tablacurso_cpp_