import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/todo.dart';

class SupabaseServices {
  static final String _url = "https://ijywzybzbkkqtlqrwkiu.supabase.co";
  static final String _anonKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlqeXd6eWJ6YmtrcXRscXJ3a2l1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTAzODg4OTksImV4cCI6MjA2NTk2NDg5OX0.cyp4lp-vhe_D-dSmSfhwS0rZ83SI3XodKLKvetQMIOY";

  static Future<Supabase> supabaseInit() async =>
      await Supabase.initialize(url: _url, anonKey: _anonKey);

  static SupabaseClient supabaseClient = Supabase.instance.client;


}
