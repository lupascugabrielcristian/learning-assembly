import 'dart:convert';

void main(List<String> args) {
	String from = args[0];

	List<int> bytes = utf8.encode(from);
	print(bytes);
}
