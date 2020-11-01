#include <iostream>
#include <map>

class storyAtom
{
    public:
        std::string atom;
        std::string description;
        std::string nextitem;
        static storyAtom stratom;

        void assignatm (std::string atm, std::string descr, std::string nitm)
        {
        atom = atm;
        description = descr;
        nextitem = nitm;
        }

};

// define story atoms objects
storyAtom atom1;
storyAtom atom2;
storyAtom atom3;

int main(int argc, char *argv[])
{
    atom1.assignatm("first", "the first atom", "second");
    atom2.assignatm(atom1.nextitem, "the second atom", "third");
    atom3.assignatm(atom2.nextitem, "the third atom", "fouth");

    // define a map
    std::map<std::string, storyAtom> storyAtoms;

    // fill the map with items
    storyAtoms[atom1.atom] = atom1;
    storyAtoms[atom1.nextitem] = atom2;
    storyAtoms[atom2.nextitem] = atom3;

    std::cout << "My first story atom is " << storyAtoms["third"].atom << std::endl;
    return 0;
}
