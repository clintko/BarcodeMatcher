#include <fstream>
#include "node.h"
void show_node(Node* node, int count = 1){
    
    for (int idx = 0; idx < 4; idx++) {
        string base = BASES[idx];
        if (!node->is_null(base)) {
            cout << string((count-1), '*') << base << endl;
            Node* node_next = node->get_child(base);
            show_node(node_next, count + 1);
        } // end if
    } // end for
} // end fun
    
void build_tree(Node* root, string read){
    Node* curr = root;
    string base;
    
    for(int idx = 0; idx < read.length(); idx++) {
        base = read[idx];
        
        if (curr->is_null(base)){
            //cout << "add base:" << base << endl;
            curr = curr->add_child(base);
        } else {
            //cout << "get base:" << base << endl;
            curr = curr->get_child(base);
        } // end if-else
        
    } // end for
}

void count_tree(Node* node, string read = "", int count = 0) {
    string base;
    if (node->is_leaf()) {
        cout << read << " " << count << endl;
    } // end if
    
    for (int idx = 0; idx < 4; idx++) {
        base = BASES[idx];
        if (!node->is_null(base)) {
            Node* node_next = node->get_child(base);
            count_tree(
                node_next, 
                read + base, 
                count + 1);
        } // end if
    } // end for
} // end func

void hamming(Node* node, const string& target, int index = 0, string read = "", int count = 0) {
    string base;
    int new_count;
    
    if (node->is_leaf()) {
        cout << read << " " << count << endl;
    } // end if
    
    for (int idx = 0; idx < 4; idx++) {
        base = BASES[idx];
        
        if (!node->is_null(base)) {
            //cout << target << endl;
            //cout << base << " " << index << "|" << target[index] << " " << (target[index] != base[0]) << endl;
            if (target[index] != base[0]) {
                new_count = count + 1;
            } else {
                new_count = count;
            }// end if
            
            Node* node_next = node->get_child(base);
            hamming(
                node_next, 
                target,
                index + 1, 
                read + base,
                new_count);
        } // end if
    } // end for
} // end func

void hamming_filter_cpp(Node* node, const string& target, const int threshold = 2, int index = 0, string read = "", int count = 0) {
    string base;
    int new_count;
    ofstream myfile;
    
    if (node->is_leaf()) {
        myfile.open("barcodes_filter.dat", ios_base::app);
        myfile << read << endl;
        myfile.close();
    } // end if
    
    
    for (int idx = 0; idx < 4; idx++) {
        base = BASES[idx];
        
        if (!node->is_null(base)) {
            if (target[index] != base[0]) {
                new_count = count + 1;
            } else {
                new_count = count;
            } // end if
            
            Node* node_next = node->get_child(base);
            if (new_count < threshold){
                hamming_filter_cpp (
                    node_next, 
                    target,
                    threshold,
                    index + 1, 
                    read + base,
                    new_count);
            } // end if
        } // end if
    } // end for
} // end func
