// ignore: unused_import
import 'package:flutter/material.dart';

String username = '';

class StartContent {
  String image = "";
  String title = "";
  String description = "";

  StartContent(
      {required this.image, required this.title, required this.description});
}

List<StartContent> contents = [
  StartContent(
      title: 'Relaxing',
      image: 'images/start.png',
      description: 'Relaxing Your Mind and Your Body'),
  StartContent(
      title: 'Exercise',
      image: 'images/start2.png',
      description: 'Relaxing Your Mind and Your Body'),
  StartContent(
      title: 'Controlling',
      image: 'images/start1.png',
      description: 'Relaxing Your Mind and Your Body'),
];
