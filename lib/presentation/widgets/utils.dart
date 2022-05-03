import 'package:flutter/material.dart';

Widget showLoader() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

Widget showRefresh() {
  return const Center(
    child: Icon(Icons.refresh),
  );
}