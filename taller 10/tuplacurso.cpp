#ifndef _tuplacurso_cpp_
#define _tuplacurso_cpp_

#include "tuplacurso.hpp"
tupla_curso::tupla_curso(){
    // cout << "hola";
    curso_cod = "";
    // cout << curso_cod;
    nombre = "";
    // cout << nombre;
    nombre_unid = "";
    // cout << nombre_unid;
    creditos = 0;
    // cout << creditos;
    num_grupos = 0;
}

tupla_curso::tupla_curso(string cod, string nom, string nom_u, int cre, int num_g){
    // cout << "hola";
    curso_cod = cod;
    // cout << curso_cod;
    nombre = nom;
    // cout << nombre;
    nombre_unid = nom_u;
    // cout << nombre_unid;
    creditos = cre;
    // cout << creditos;
    num_grupos = num_g;
}
tupla_curso::~tupla_curso(){
}

string tupla_curso::obtener_curso_cod(){
    return curso_cod;
}

string tupla_curso::obtener_nombre(){
    return nombre;
}

string tupla_curso::obtener_nombre_unid(){
    return nombre_unid;
}

int tupla_curso::obtener_creditos(){
    return creditos;
}

int tupla_curso::obtener_num_grupos(){
    return num_grupos;
}

void tupla_curso::imprimirTupla(){
        cout << "curso_cod:" << obtener_curso_cod() << endl;
        cout << "nombre:" << obtener_nombre() << endl;
        cout << "nombre_unid:" << obtener_nombre_unid() << endl;
        cout << "creditos:" << obtener_creditos() << endl;
        cout << "num_grupos:" << obtener_num_grupos() << endl;
}

void tupla_curso::write(std::ostream& f){
        size_t size;
        size = curso_cod.size();
        f.write( (char*)&size, sizeof(size_t) );
        f.write( (char*)curso_cod.c_str(), size );

        size = nombre.size();
        f.write( (char*)&size, sizeof(size_t) );
        f.write( (char*)nombre.c_str(), size );

        size = nombre_unid.size();
        f.write( (char*)&size, sizeof(size_t) );
        f.write( (char*)nombre_unid.c_str(), size );

        f.write( (char*)&creditos, sizeof(int) );

        f.write( (char*)&num_grupos, sizeof(int) );
}


void tupla_curso::read(std::istream& f){

        size_t size;
        char *data;
        f.read( (char*)&size, sizeof(size_t) );

        data = new char[size+1];
        f.read( data, size );
        data[size]='\0';
        curso_cod = data;
        delete data;

        f.read( (char*)&size, sizeof(size_t) );

        data = new char[size+2];
        f.read( data, size );
        data[size]='\0';
        nombre = data;
        delete data;

        f.read( (char*)&size, sizeof(size_t) );

        data = new char[size+3];
        f.read( data, size );
        data[size]='\0';
        nombre_unid = data;
        delete data;

        f.read( (char*)&this->creditos, sizeof(int) );
        f.read( (char*)&this->num_grupos, sizeof(int) );
}

#endif //_tuplacurso_cpp_