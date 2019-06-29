#include <algorithm>
#include <fstream>
#include <utility>

using namespace std;

// Array di coppie di interi
vector <pair<int, int>> arr;

int main(void) {
	ifstream in("input.txt");
	int N;
	in >> N;
	arr.resize(N);
	for (int i = 0; i < N; i++)
		in >> arr[i].first >> arr[i].second;

	// ordina prima per first, poi per second
	sort(arr.begin(), arr.end());

	// l'istante piu grande coperto dagli intervalli
	int right = arr[0].second;

	// La migliore soluzione trovata fino a questo punto
	int stbest = -1;
	int enbest = -1;
	for (int i = 1; i < N; i++) {

		if (arr[i].first - right > enbest - stbest) {
			// abbiamo trovato un nuovo massimo
			stbest = right;
			enbest = arr[i].first;
		}

		right = max(right, arr[i].second);
	}

	ofstream out("output.txt");
	if (stbest == -1)
		out << 0 << endl;
	else
		out << stbest << " " << enbest << endl;

	return 0;
}
