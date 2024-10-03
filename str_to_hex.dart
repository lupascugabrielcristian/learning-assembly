import 'dart:convert';

void main(List<String> args) {
	String from = args[0];

	List<int> bytes = utf8.encode(from);
	String hexStr = bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ');
	print(hexStr);
}
