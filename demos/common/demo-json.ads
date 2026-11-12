--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

with ACP.Types;
with VSS.Stream_Element_Vectors;
with VSS.Strings;

package Demo.JSON is
   subtype Value is ACP.Types.Any_Value;

   function Parse
     (Data : VSS.Stream_Element_Vectors.Stream_Element_Vector;
      Item : out Value) return Boolean;
   function Encode
     (Item : Value'Class)
      return VSS.Stream_Element_Vectors.Stream_Element_Vector;

   function Member
     (Item : Value'Class; Name : VSS.Strings.Virtual_String) return Value;
   --  Empty means absent or duplicate. Input must be parsed, valid JSON.
   function Is_Object (Item : Value'Class) return Boolean;
   function Is_String (Item : Value'Class) return Boolean;
   function Is_Integer (Item : Value'Class) return Boolean;
   function Text (Item : Value'Class) return VSS.Strings.Virtual_String;
   function Text
     (Item : Value'Class; Name : VSS.Strings.Virtual_String)
      return VSS.Strings.Virtual_String;
   function Element (List : Value'Class; Index : Positive) return Value;

   function Object_Value return Value;
   function Array_Value return Value;
   function String_Value (Item : VSS.Strings.Virtual_String) return Value;
   function Integer_Value (Item : ACP.Types.Integer_64) return Value;
   function Null_Value return Value;
   procedure Add
     (Object : in out Value'Class;
      Name   : VSS.Strings.Virtual_String;
      Item   : Value'Class);
   procedure Append (List : in out Value'Class; Item : Value'Class);

   function Request
     (Identifier : Value; Method : VSS.Strings.Virtual_String; Params : Value)
      return Value;
   function Response (Identifier : Value; Result : Value) return Value;
   function Error_Response
     (Identifier : Value;
      Code       : ACP.Types.Integer_64;
      Message    : VSS.Strings.Virtual_String;
      Data       : Value := Object_Value) return Value;
end Demo.JSON;
