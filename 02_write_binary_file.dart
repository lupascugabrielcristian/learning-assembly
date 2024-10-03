import 'dart:io';
import 'dart:typed_data';

void main() {
	final fromFile = 'ex1/work';
	final toFile = 'output/work';

	Uint8List data = File(fromFile).readAsBytesSync();

	String toFind = '48 65 6c 6c 6f';
	List<int> replacements = [67, 114, 105, 115, 116];
	int matchPosition = findHex(toFind, data);
	if (matchPosition != -1) {
		replaceRange(matchPosition, replacements, data);
	}

	File outputFile = File(toFile);
	outputFile.writeAsBytes(data);
}

int findHex(String hex, Uint8List data) {
	final intList = hex.split(' ').map((x) => int.parse(x, radix: 16)).toList();
	Uint8List toFind = Uint8List.fromList(intList);
	final pos = search(data, toFind);
	if ( pos != -1) {
		print('Found');
	}
	return pos;
}

int search(Uint8List data, Uint8List toFind) {
	for (int i = 0; i < data.length; i++ ) {
		if (data[i] == toFind[0]) {
			bool isMatch = checkPosibleMatch(data.sublist(i, i + toFind.length), toFind);

			if (isMatch == true) {
				return i;
			}
		}
	}

	return -1;
}

bool checkPosibleMatch(Uint8List data, Uint8List toFind) {
	int currentIndex = 0;
	while(currentIndex < toFind.length) {
		if(data[currentIndex] != toFind[currentIndex]) {
			return false;
		}
		currentIndex += 1;
	}

	return true;
}

void replaceRange(int matchPosition, List<int> replacements, Uint8List data) {
	int pos = 0;
	for (final v in replacements) {
		data[matchPosition + pos] = replacements[pos];
		pos += 1;
	}
}
