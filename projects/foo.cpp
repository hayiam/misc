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

int main(int argc, char *argv[])
{
    atom1.assignatm("first", "the first atom", "second");
    atom2.assignatm(atom1.nextitem, "the second atom", "third");

    // define a map
    std::map<std::string, storyAtom> storyAtoms;

    // fill the map with items
    storyAtoms["first"] = atom1;
    storyAtoms["second"] = atom2;

    std::cout << "My first story atom is " << storyAtoms["second"].atom << std::endl;
    return 0;
}
