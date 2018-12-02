struct symrec
{
    char *name;
    int addr;
    char *type;
    struct symrec *next; 
};

typedef struct symrec symrec;
symrec *sym_table = (symrec *)0;
symrec *putsym();

symrec *putsym(char *sym_name)
{
    symrec *ptr;
    ptr = (symrec *)malloc(sizeof(symrec));
    ptr->name = (char *)malloc(strlen(sym_name) + 1);
    ptr->type = NULL;
    strcpy(ptr->name,sym_name);
    ptr->next = (struct symrec *)sym_table;
    sym_table = ptr;
    return ptr;
}

void print_sym_table()
{
    symrec *ptr;
    for (ptr = sym_table; ptr != (symrec *)0; ptr = (symrec *)ptr->next)
        printf("\n%s %s\n", ptr->name, ptr -> type);
}

void set_type(char *type)
{
    symrec *ptr;
    for (ptr = sym_table; ptr != (symrec *)0; ptr = (symrec *)ptr->next) {
        if (ptr->type == NULL) {
            ptr->type = (char *)malloc(strlen(type) + 1);
            strcpy(ptr->type, type);
        }
    }
}