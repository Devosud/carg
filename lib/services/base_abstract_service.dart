import 'package:carg/exceptions/service_exception.dart';
import 'package:carg/models/carg_object.dart';
import 'package:carg/repositories/firebase_abstract_repository.dart';

import 'dart:developer' as developer;

abstract class BaseAbstractService<T extends CargObject> {
  final FirebaseAbstractRepository<T> firebaseAbstractRepository;

  BaseAbstractService({required this.firebaseAbstractRepository});

  /// Get a [T] object from the database
  /// Take an [id] and return a [T]
  Future<T?> get(String? id) async {
    if (id == null) {
      throw ServiceException('Please provide an ID');
    }
    developer.log('Get document $id');
    return await firebaseAbstractRepository.get(id);
  }

  /// Delete a [T] object from the database
  /// Take an [id] and return nothing
  Future<void> delete(String id) async {
    developer.log('Delete document $id');
    await firebaseAbstractRepository.delete(id);
  }

  /// Update a [T] object in the database
  /// Take a [T] and return nothing
  Future<void> update(T? t) async {
    if (t == null || t.id == null) {
      throw ServiceException('Please provide an object with an ID for the update');
    }
    developer.log('Document ${t.id} updated');
    return await firebaseAbstractRepository.update(t);
  }

  /// Create a [T] object in the database
  /// Take a [T] and return the ID of the new document
  Future<String> create(T? t) async {
    if (t == null) {
      throw ServiceException('Please provide an object to create');
    }
    var id =  await firebaseAbstractRepository.create(t);
    developer.log('Document $id created');
    return id;
  }
}
