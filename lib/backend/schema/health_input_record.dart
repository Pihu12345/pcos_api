import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HealthInputRecord extends FirestoreRecord {
  HealthInputRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "weight" field.
  int? _weight;
  int get weight => _weight ?? 0;
  bool hasWeight() => _weight != null;

  // "height" field.
  int? _height;
  int get height => _height ?? 0;
  bool hasHeight() => _height != null;

  // "cycleReg" field.
  String? _cycleReg;
  String get cycleReg => _cycleReg ?? '';
  bool hasCycleReg() => _cycleReg != null;

  // "cycleLength" field.
  int? _cycleLength;
  int get cycleLength => _cycleLength ?? 0;
  bool hasCycleLength() => _cycleLength != null;

  // "AMHLevel" field.
  int? _aMHLevel;
  int get aMHLevel => _aMHLevel ?? 0;
  bool hasAMHLevel() => _aMHLevel != null;

  // "hairGrowth" field.
  bool? _hairGrowth;
  bool get hairGrowth => _hairGrowth ?? false;
  bool hasHairGrowth() => _hairGrowth != null;

  // "pimples" field.
  bool? _pimples;
  bool get pimples => _pimples ?? false;
  bool hasPimples() => _pimples != null;

  // "skinDarkening" field.
  bool? _skinDarkening;
  bool get skinDarkening => _skinDarkening ?? false;
  bool hasSkinDarkening() => _skinDarkening != null;

  // "hairLoss" field.
  bool? _hairLoss;
  bool get hairLoss => _hairLoss ?? false;
  bool hasHairLoss() => _hairLoss != null;

  // "weightGain" field.
  bool? _weightGain;
  bool get weightGain => _weightGain ?? false;
  bool hasWeightGain() => _weightGain != null;

  // "fastFood" field.
  bool? _fastFood;
  bool get fastFood => _fastFood ?? false;
  bool hasFastFood() => _fastFood != null;

  // "regExercise" field.
  bool? _regExercise;
  bool get regExercise => _regExercise ?? false;
  bool hasRegExercise() => _regExercise != null;

  void _initializeFields() {
    _age = castToType<int>(snapshotData['age']);
    _weight = castToType<int>(snapshotData['weight']);
    _height = castToType<int>(snapshotData['height']);
    _cycleReg = snapshotData['cycleReg'] as String?;
    _cycleLength = castToType<int>(snapshotData['cycleLength']);
    _aMHLevel = castToType<int>(snapshotData['AMHLevel']);
    _hairGrowth = snapshotData['hairGrowth'] as bool?;
    _pimples = snapshotData['pimples'] as bool?;
    _skinDarkening = snapshotData['skinDarkening'] as bool?;
    _hairLoss = snapshotData['hairLoss'] as bool?;
    _weightGain = snapshotData['weightGain'] as bool?;
    _fastFood = snapshotData['fastFood'] as bool?;
    _regExercise = snapshotData['regExercise'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('health_input');

  static Stream<HealthInputRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HealthInputRecord.fromSnapshot(s));

  static Future<HealthInputRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HealthInputRecord.fromSnapshot(s));

  static HealthInputRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HealthInputRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HealthInputRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HealthInputRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HealthInputRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HealthInputRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHealthInputRecordData({
  int? age,
  int? weight,
  int? height,
  String? cycleReg,
  int? cycleLength,
  int? aMHLevel,
  bool? hairGrowth,
  bool? pimples,
  bool? skinDarkening,
  bool? hairLoss,
  bool? weightGain,
  bool? fastFood,
  bool? regExercise,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'age': age,
      'weight': weight,
      'height': height,
      'cycleReg': cycleReg,
      'cycleLength': cycleLength,
      'AMHLevel': aMHLevel,
      'hairGrowth': hairGrowth,
      'pimples': pimples,
      'skinDarkening': skinDarkening,
      'hairLoss': hairLoss,
      'weightGain': weightGain,
      'fastFood': fastFood,
      'regExercise': regExercise,
    }.withoutNulls,
  );

  return firestoreData;
}

class HealthInputRecordDocumentEquality implements Equality<HealthInputRecord> {
  const HealthInputRecordDocumentEquality();

  @override
  bool equals(HealthInputRecord? e1, HealthInputRecord? e2) {
    return e1?.age == e2?.age &&
        e1?.weight == e2?.weight &&
        e1?.height == e2?.height &&
        e1?.cycleReg == e2?.cycleReg &&
        e1?.cycleLength == e2?.cycleLength &&
        e1?.aMHLevel == e2?.aMHLevel &&
        e1?.hairGrowth == e2?.hairGrowth &&
        e1?.pimples == e2?.pimples &&
        e1?.skinDarkening == e2?.skinDarkening &&
        e1?.hairLoss == e2?.hairLoss &&
        e1?.weightGain == e2?.weightGain &&
        e1?.fastFood == e2?.fastFood &&
        e1?.regExercise == e2?.regExercise;
  }

  @override
  int hash(HealthInputRecord? e) => const ListEquality().hash([
        e?.age,
        e?.weight,
        e?.height,
        e?.cycleReg,
        e?.cycleLength,
        e?.aMHLevel,
        e?.hairGrowth,
        e?.pimples,
        e?.skinDarkening,
        e?.hairLoss,
        e?.weightGain,
        e?.fastFood,
        e?.regExercise
      ]);

  @override
  bool isValidKey(Object? o) => o is HealthInputRecord;
}
