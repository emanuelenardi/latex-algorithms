#include <fstream>
using namespace std;

int N;
int array[1000000]; // dichiarato con la dimensione massima

int main() {
	ifstream in("input.txt");
	in >> N;
	for (int i = 0; i < N; i++)
		in >> array[i];

	int mx = 0; // soluzione parziale

	// per ogni sottosequenza
	for (int i = 0; i < N; i++) {
		for (int j = i; j < N; j++) {

			// calcola somma della sottosequenza
			int tot = 0;
			for (int k = i; k <= j; k++)
				tot += array[k];

			mx = max(mx, tot);
		}
	}

	ofstream out("output.txt");
	out << mx << endl;
	return 0;
}
