import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double? getPercentage(
  int c1,
  int c2,
) {
  int total = c1 + c2;
  return c1 / total;
}

double? getTotal(
  double a1,
  double a2,
) {
  return a1 + a2;
}

bool? canShowPoll(
  bool userAllowsNSFW,
  bool isPollNSFW,
  bool isDeleted,
) {
  if ((!userAllowsNSFW && isPollNSFW) || isDeleted) {
    return false;
  }
  return true;
}

String? getPollLink(String docID) {
  String finalLink = 'poll/' + docID;
  return finalLink;
}
