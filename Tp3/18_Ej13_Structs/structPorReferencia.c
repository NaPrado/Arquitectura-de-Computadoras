struct structPorReferencia{
    int a;
    int b;
};

struct structPorReferencia* foo(struct structPorReferencia* structura){
    return structura;
}
int main(int argc, char const *argv[]){
    struct structPorReferencia* structura;
    structura->a=10;
    structura->b=11;
    foo(structura);
    return 0;
}