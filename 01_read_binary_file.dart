import 'dart:typed_data';
import 'dart:io';

void main(List<String> args) {
	Uint8List data = File(args[0]).readAsBytesSync();

	int chunkSize = 20;

	int totalBytesRead = 0;
	for (int i = 0; i < data.length; i += chunkSize) {
		int endChunk = (i + chunkSize < data.length) ? i + chunkSize : data.length;
		Uint8List chunk = data.sublist(i, endChunk);
		final chunkStr = chunk.map((x) => x.toRadixString(16).padLeft(2, '0')).toList();
		final chunkAscii = String.fromCharCodes(chunk);

		String address = totalBytesRead.toRadixString(16).padLeft(8, '0');
		print("$address   ${chunkStr.join(' ')}   $chunkAscii");
		totalBytesRead += chunkSize;
	}
}
