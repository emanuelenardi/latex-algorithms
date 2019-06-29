#include <fstream>

using namespace std;

int R, C;

int A[1001][1001]; // matrice con i valori
int S[1001][1001]; // matrice di appoggio
// S[i][j] é uguale alla somma della riga i fino all'elemento j

int main(void) {
	ifstream in("input.txt");
	ofstream out("output.txt");

	in >> R >> C;

	for (int i = 1; i <= R; i++) {
		// mantiene la somma della riga corrente
		int sumr = 0;
		for (int j = 1; j <= C; j++) {
		// scorro le colonne

			in >> A[i][j];   // prende in input il numero
			sumr += A[i][j]; // lo somma alla somma parziale della riga corrente
			S[i][j] = sumr;  // memorizza la somma paziale nella matrice di aiuto
		}
	}

	int sol = -1;
	// per ogni coppia di colonne
	for (int c1 = 1; c1 <= C; c1++) {
		for (int c2 = c1; c2 <= C; c2++) {
			// visito la colonna con l'algoritmo lineare per la sottosequenza

			int tot = 0;
			for (int r = 1; r <= R; r++) {
				int cur = S[r][c2] - S[r][c1-1];
				tot = max(cur,cur+tot);
				sol = max(sol,tot);
			}
		}
	}

	out << sol << endl;

	return 0;
}
