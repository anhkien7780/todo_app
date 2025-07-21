import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class SupabaseServices {
  static final String _url = "https://ijywzybzbkkqtlqrwkiu.supabase.co";
  static final String _anonKey = dotenv.env["SUPABASE_API_KEY"] ?? "";

  static Future<Supabase> supabaseInit() async =>
      await Supabase.initialize(url: _url, anonKey: _anonKey);

  static SupabaseClient supabaseClient = Supabase.instance.client;

}
