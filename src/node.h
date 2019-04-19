#include <iostream>
#include <map>
using namespace std;

const string BASES[] = {"A", "T", "C", "G"};

class Node {
        int width, height;
        map<string, Node *> dct;
    public:
        Node ();
        Node (int, int);
        int area () {return (width*height);}
        Node* get_child(string);
        Node* add_child(string);
        bool is_null(string);
        bool is_leaf();
};

Node::Node () {
    width  = 5;
    height = 10;
    
    // null pointers
    dct["A"] = 0;
    dct["T"] = 0;
    dct["C"] = 0;
    dct["G"] = 0;
}

Node::Node (int a, int b) {
    width  = a;
    height = b;
}

Node* Node::get_child(string base){
    return dct[base];
}

Node* Node::add_child(string base){
    Node* new_node = new Node();
    dct[base] = new_node;
    return new_node;
}

bool Node::is_null(string base) {
    if (dct[base]) {
        return false;
    } else {
        return true;
    }
}

bool Node::is_leaf() {
    string base;
    for (int idx = 0; idx < 4; idx++) {
        base = BASES[idx];
        
        // if one is not null, we know it is not leaf
        if (dct[base]) {
            return false;
        } // end if
        
    } // end for
    return true;
}