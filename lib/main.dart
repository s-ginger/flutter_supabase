import 'package:flutter/material.dart';
import 'package:my_notesflutter/repository/repository.dart';
import 'package:my_notesflutter/supabase/supabase.dart';
import 'package:my_notesflutter/view/view.dart';
import 'my_app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


Future<void> main() async {
  await InitSupabase();
  runApp(
    DataWidget(
      authRepo: SupabaseRepository(client: Supabase.instance.client),
      child: const MyApp()
    )
  );
}


