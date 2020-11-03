#include <iostream>
#include <map>

class storyAtom
{
    public:
        std::string atom;
        std::string description;
        std::string nextitem;

        void assignatm (std::string atm, std::string descr, std::string nitm)
        {
        atom = atm;
        description = descr;
        nextitem = nitm;
        }

};

int main(int argc, char *argv[])
{
unsigned int f, i, j;

f=3; // the size of an array

// create an array to define story atoms objects
storyAtom atom[f];

    atom[0].assignatm("first", "the first atom", "second");
    atom[1].assignatm(atom[0].nextitem, "the second atom", "third");
    atom[f-1].assignatm(atom[f-2].nextitem, "the third atom", "fouth");

    // define a map
    std::map<std::string, storyAtom> storyAtoms;

    // fill the map with items
    storyAtoms[atom[0].atom] = atom[0];
    for (i=0; i<(f-1); i++) {
        for (j=1; j<f; j++) {
    storyAtoms[atom[i].nextitem] = atom[j];
    }
    }

    std::cout << "My first story atom is " << storyAtoms["third"].description << std::endl;
    return 0;
}
