--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

with Ada.Streams;

with VSS.JSON.Pull_Readers.Simple;
with VSS.JSON.Push_Writers;
with VSS.Stream_Element_Vectors.Conversions;
with VSS.Text_Streams.Memory_UTF8_Input;
with VSS.Text_Streams.Memory_UTF8_Output;

package body JSON_Codecs is

   -----------
   -- Parse --
   -----------

   function Parse (JSON : String; Value : out Value_Type) return Boolean is
      Data    : VSS.Stream_Element_Vectors.Stream_Element_Vector;
      Stream  :
        aliased VSS.Text_Streams.Memory_UTF8_Input.Memory_UTF8_Input_Stream;
      Reader  : VSS.JSON.Pull_Readers.Simple.JSON_Simple_Pull_Reader;
      Success : Boolean := True;
   begin
      for Item of JSON loop
         Data.Append (Ada.Streams.Stream_Element (Character'Pos (Item)));
      end loop;
      Stream.Set_Data (Data);
      Reader.Set_Stream (Stream'Unchecked_Access);
      Reader.Read_Next;
      if not Reader.Is_Start_Document then
         return False;
      end if;
      Reader.Read_Next;
      Input (Reader, Value, Success);
      return Success and then Reader.Is_End_Document;
   end Parse;

   -------------
   -- To_JSON --
   -------------

   function To_JSON (Value : Value_Type) return String is
      Stream :
        aliased VSS.Text_Streams.Memory_UTF8_Output.Memory_UTF8_Output_Stream;
      Writer : VSS.JSON.Push_Writers.JSON_Simple_Push_Writer;
   begin
      Writer.Set_Stream (Stream'Unchecked_Access);
      Writer.Start_Document;
      Output (Writer, Value);
      Writer.End_Document;
      if not Writer.Error_Message.Is_Empty then
         raise Program_Error with "cannot serialize JSON";
      end if;
      return
        VSS.Stream_Element_Vectors.Conversions.Unchecked_To_String
          (Stream.Buffer);
   end To_JSON;

   ----------------
   -- Round_Trip --
   ----------------

   procedure Round_Trip (JSON : String) is
      Value : Value_Type;
   begin
      if not Parse (JSON, Value) then
         raise Program_Error with "cannot parse: " & JSON;
      end if;
      declare
         Result : constant String := To_JSON (Value);
      begin
         if Result /= JSON then
            raise Program_Error
              with "expected: " & JSON & ASCII.LF & "actual: " & Result;
         end if;
      end;
   end Round_Trip;

end JSON_Codecs;
