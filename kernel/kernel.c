/* This will force us to create a kernel entry function instead of jumping to kernel.c:0x00 */
void dummy_test_entrypoint() {
}

void hello() {
    char* video_memory = (char*) 0xb8000;
    *video_memory = 'H';

    char* e = (char*) 0xb8002;
    *e = 'e';

    char* l = (char*) 0xb8004;
    *l = 'l';

    l = (char*) 0xb8006;
    *l = 'l';

    l = (char*) 0xb8008;
    *l = 'o';

    l = (char*) 0xb800a;
    *l = ' ';
}

void world() {
    char* l = (char*) 0xb800c;
        *l = 'W';

        l = (char*) 0xb800e;
        *l = 'o';

        l = (char*) 0xb8010;
        *l = 'r';

        l = (char*) 0xb8012;
        *l = 'l';

        l = (char*) 0xb8014;
        *l = 'd';

}
void space() {
    char* l = (char*) 0xb8016;
        *l = ' ';


        l = (char*) 0xb8018;
        *l = ' ';


        l = (char*) 0xb801a;
        *l = ' ';


        l = (char*) 0xb801c;
        *l = ' ';


        l = (char*) 0xb801e;
        *l = ' ';


        l = (char*) 0xb8020;
        *l = ' ';


        l = (char*) 0xb8022;
        *l = ' ';


        l = (char*) 0xb8024;
        *l = ' ';


        l = (char*) 0xb8026;
        *l = ' ';


        l = (char*) 0xb8028;
        *l = ' ';


        l = (char*) 0xb802a;
        *l = ' ';


        l = (char*) 0xb802c;
        *l = ' ';


        l = (char*) 0xb802e;
        *l = ' ';


        l = (char*) 0xb8030;
        *l = ' ';

        l = (char*) 0xb8032;
        *l = ' ';


        l = (char*) 0xb8034;
        *l = ' ';


        l = (char*) 0xb8036;
        *l = ' ';


        l = (char*) 0xb8038;
        *l = ' ';


        l = (char*) 0xb803a;
        *l = ' ';


        l = (char*) 0xb803c;
        *l = ' ';


        l = (char*) 0xb803e;
        *l = ' ';




        l = (char*) 0xb8040;
        *l = ' ';

        l = (char*) 0xb8042;
        *l = ' ';


        l = (char*) 0xb8044;
        *l = ' ';


        l = (char*) 0xb8046;
        *l = ' ';

}
void main() {
    hello();
    world();
    space();
}