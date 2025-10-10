#include <iostream>  // library import
using namespace std; // avoid prefix std:: everywhere

int main()
{                   // entry point
    cout << "Hi\n"; // print text
    int x = 5;      // declare integer
    if (x > 0)
    {
        cout << "Positive\n";
    }
    for (int i = 0; i < 3; i++)
    {
        cout << i << endl; // loop
    }
    return 0; // exit code
}
