import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Iniciar sesión con correo y contraseña
  Future<void> loginUser({
    required String email,
    required String password,
    required VoidCallback onSuccess,
    required Function(String) onError,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      onSuccess();
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'No se encontró un usuario con este correo.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Contraseña incorrecta.';
      } else {
        errorMessage = 'Error: ${e.message}';
      }
      onError(errorMessage);
    } catch (e) {
      print("Error durante el inicio de sesión: $e");
      onError(e.toString());
      //onError('Ocurrió un error inesperado. Por favor, inténtalo de nuevo.');
    }
  }

  /// Registrar un nuevo usuario
  Future<void> registerUser({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
    required String petName,
    required String petSpecies,
    required String petBreed,
    required String petAge,
    required String petGender,
    required VoidCallback onSuccess,
    required Function(String) onError,
  }) async {
    // Validación básica
    if (password != confirmPassword) {
      onError("Las contraseñas no coinciden.");
      return;
    }
    if (password.length < 8) {
      onError("La contraseña debe tener al menos 8 caracteres.");
      return;
    }

    try {
      // Registrar el usuario en Firebase
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Puedes guardar la información adicional del usuario (nombre, teléfono, etc.) en Firestore
      // Esto es opcional y depende de cómo estructures tu base de datos.
      
      onSuccess();  // Si todo va bien, ejecuta el callback de éxito
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'email-already-in-use') {
        errorMessage = 'El correo ya está registrado.';
      } else if (e.code == 'weak-password') {
        errorMessage = 'La contraseña debe tener al menos 6 caracteres.';
      } else {
        errorMessage = 'Error: ${e.message}';
      }
      onError(errorMessage);
    } catch (e) {
      onError('Ocurrió un error inesperado. Por favor, inténtalo de nuevo.');
    }
  }

  /// Cerrar sesión del usuario actual
  Future<void> logoutUser({
    required VoidCallback onSuccess,
    required Function(String) onError,
  }) async {
    try {
      await _auth.signOut();
      onSuccess();
    } catch (e) {
      onError('No se pudo cerrar sesión. Por favor, inténtalo de nuevo.');
    }
  }

  /// Obtener el usuario actualmente autenticado
  User? get currentUser => _auth.currentUser;

  /// Escuchar cambios en el estado de autenticación
  Stream<User?> get authStateChanges => _auth.authStateChanges();
}