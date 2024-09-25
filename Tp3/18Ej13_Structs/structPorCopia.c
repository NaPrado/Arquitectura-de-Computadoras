struct structPorCopia{
    int a;
    int b;
};

struct structPorCopia foo(struct structPorCopia structura){
    return structura;
}
int main(int argc, char const *argv[]){
    struct structPorCopia structura;
    structura.a=10;
    structura.b=11;
    foo(structura);
    return 0;
}
