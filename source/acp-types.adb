--  SPDX-FileCopyrightText: 2026 Max Reznik <reznikmm@gmail.com>
--
--  SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
--
--  Generated from the ACP v2 schema. See schema/README.md.

pragma Style_Checks ("M99");  --  suppress style warning unitl gnatpp is fixed
with Ada.Unchecked_Deallocation;

package body ACP.Types is
   procedure Free is new
     Ada.Unchecked_Deallocation (EnumOption_Array, EnumOption_Array_Access);

   overriding
   procedure Adjust (Self : in out EnumOption_Vector) is
   begin
      if Self.Length > 0 then
         Self.Data := new EnumOption_Array'(Self.Data (1 .. Self.Length));
      end if;
   end Adjust;

   overriding
   procedure Finalize (Self : in out EnumOption_Vector) is
   begin
      Free (Self.Data);
      Self.Length := 0;
   end Finalize;

   function Empty return EnumOption_Vector
   is (Ada.Finalization.Controlled with others => <>);

   function Is_Null (Self : EnumOption_Vector) return Boolean
   is (Self.Is_Null);

   function Length (Self : EnumOption_Vector) return Natural
   is (Self.Length);

   procedure Clear (Self : in out EnumOption_Vector; Is_Null : Boolean := True)
   is
   begin
      Self.Length := 0;
      Self.Is_Null := Is_Null;
   end Clear;

   procedure Append (Self : in out EnumOption_Vector; Value : EnumOption) is
      Init_Length     : constant Positive :=
        Positive'Max (2, 256 / EnumOption'Size);
      Self_Data_Saved : EnumOption_Array_Access := Self.Data;
   begin
      if Self.Length = 0 then
         Self.Is_Null := False;
         Self.Data := new EnumOption_Array (1 .. Init_Length);
      elsif Self.Length = Self.Data'Last then
         Self.Data := new EnumOption_Array (1 .. 3 * Self.Length / 2 + 1);
         Self.Data (1 .. Self.Length) := Self_Data_Saved.all;
         Free (Self_Data_Saved);
      end if;
      Self.Length := Self.Length + 1;
      Self.Data (Self.Length) := Value;
   end Append;

   not overriding
   function Get_EnumOption_Variable_Reference
     (Self : aliased in out EnumOption_Vector; Index : Positive)
      return EnumOption_Variable_Reference
   is (Element => Self.Data (Index)'Access);

   not overriding
   function Get_EnumOption_Constant_Reference
     (Self : aliased EnumOption_Vector; Index : Positive)
      return EnumOption_Constant_Reference
   is (Element => Self.Data (Index)'Access);

   procedure Free is new
     Ada.Unchecked_Deallocation
       (SessionConfigSelectOption_Array,
        SessionConfigSelectOption_Array_Access);

   overriding
   procedure Adjust (Self : in out SessionConfigSelectOption_Vector) is
   begin
      if Self.Length > 0 then
         Self.Data :=
           new SessionConfigSelectOption_Array'(Self.Data (1 .. Self.Length));
      end if;
   end Adjust;

   overriding
   procedure Finalize (Self : in out SessionConfigSelectOption_Vector) is
   begin
      Free (Self.Data);
      Self.Length := 0;
   end Finalize;

   function Empty return SessionConfigSelectOption_Vector
   is (Ada.Finalization.Controlled with others => <>);

   function Is_Null (Self : SessionConfigSelectOption_Vector) return Boolean
   is (Self.Is_Null);

   function Length (Self : SessionConfigSelectOption_Vector) return Natural
   is (Self.Length);

   procedure Clear
     (Self    : in out SessionConfigSelectOption_Vector;
      Is_Null : Boolean := True) is
   begin
      Self.Length := 0;
      Self.Is_Null := Is_Null;
   end Clear;

   procedure Append
     (Self  : in out SessionConfigSelectOption_Vector;
      Value : SessionConfigSelectOption)
   is
      Init_Length     : constant Positive :=
        Positive'Max (2, 256 / SessionConfigSelectOption'Size);
      Self_Data_Saved : SessionConfigSelectOption_Array_Access := Self.Data;
   begin
      if Self.Length = 0 then
         Self.Is_Null := False;
         Self.Data := new SessionConfigSelectOption_Array (1 .. Init_Length);
      elsif Self.Length = Self.Data'Last then
         Self.Data :=
           new SessionConfigSelectOption_Array (1 .. 3 * Self.Length / 2 + 1);
         Self.Data (1 .. Self.Length) := Self_Data_Saved.all;
         Free (Self_Data_Saved);
      end if;
      Self.Length := Self.Length + 1;
      Self.Data (Self.Length) := Value;
   end Append;

   not overriding
   function Get_SessionConfigSelectOption_Variable_Reference
     (Self : aliased in out SessionConfigSelectOption_Vector; Index : Positive)
      return SessionConfigSelectOption_Variable_Reference
   is (Element => Self.Data (Index)'Access);

   not overriding
   function Get_SessionConfigSelectOption_Constant_Reference
     (Self : aliased SessionConfigSelectOption_Vector; Index : Positive)
      return SessionConfigSelectOption_Constant_Reference
   is (Element => Self.Data (Index)'Access);

   procedure Free is new
     Ada.Unchecked_Deallocation (SessionInfo_Array, SessionInfo_Array_Access);

   overriding
   procedure Adjust (Self : in out SessionInfo_Vector) is
   begin
      if Self.Length > 0 then
         Self.Data := new SessionInfo_Array'(Self.Data (1 .. Self.Length));
      end if;
   end Adjust;

   overriding
   procedure Finalize (Self : in out SessionInfo_Vector) is
   begin
      Free (Self.Data);
      Self.Length := 0;
   end Finalize;

   function Empty return SessionInfo_Vector
   is (Ada.Finalization.Controlled with others => <>);

   function Is_Null (Self : SessionInfo_Vector) return Boolean
   is (Self.Is_Null);

   function Length (Self : SessionInfo_Vector) return Natural
   is (Self.Length);

   procedure Clear
     (Self : in out SessionInfo_Vector; Is_Null : Boolean := True) is
   begin
      Self.Length := 0;
      Self.Is_Null := Is_Null;
   end Clear;

   procedure Append (Self : in out SessionInfo_Vector; Value : SessionInfo) is
      Init_Length     : constant Positive :=
        Positive'Max (2, 256 / SessionInfo'Size);
      Self_Data_Saved : SessionInfo_Array_Access := Self.Data;
   begin
      if Self.Length = 0 then
         Self.Is_Null := False;
         Self.Data := new SessionInfo_Array (1 .. Init_Length);
      elsif Self.Length = Self.Data'Last then
         Self.Data := new SessionInfo_Array (1 .. 3 * Self.Length / 2 + 1);
         Self.Data (1 .. Self.Length) := Self_Data_Saved.all;
         Free (Self_Data_Saved);
      end if;
      Self.Length := Self.Length + 1;
      Self.Data (Self.Length) := Value;
   end Append;

   not overriding
   function Get_SessionInfo_Variable_Reference
     (Self : aliased in out SessionInfo_Vector; Index : Positive)
      return SessionInfo_Variable_Reference
   is (Element => Self.Data (Index)'Access);

   not overriding
   function Get_SessionInfo_Constant_Reference
     (Self : aliased SessionInfo_Vector; Index : Positive)
      return SessionInfo_Constant_Reference
   is (Element => Self.Data (Index)'Access);

   procedure Free is new
     Ada.Unchecked_Deallocation
       (SessionConfigOption_Array,
        SessionConfigOption_Array_Access);

   overriding
   procedure Adjust (Self : in out SessionConfigOption_Vector) is
   begin
      if Self.Length > 0 then
         Self.Data :=
           new SessionConfigOption_Array'(Self.Data (1 .. Self.Length));
      end if;
   end Adjust;

   overriding
   procedure Finalize (Self : in out SessionConfigOption_Vector) is
   begin
      Free (Self.Data);
      Self.Length := 0;
   end Finalize;

   function Empty return SessionConfigOption_Vector
   is (Ada.Finalization.Controlled with others => <>);

   function Is_Null (Self : SessionConfigOption_Vector) return Boolean
   is (Self.Is_Null);

   function Length (Self : SessionConfigOption_Vector) return Natural
   is (Self.Length);

   procedure Clear
     (Self : in out SessionConfigOption_Vector; Is_Null : Boolean := True) is
   begin
      Self.Length := 0;
      Self.Is_Null := Is_Null;
   end Clear;

   procedure Append
     (Self : in out SessionConfigOption_Vector; Value : SessionConfigOption)
   is
      Init_Length     : constant Positive :=
        Positive'Max (2, 256 / SessionConfigOption'Size);
      Self_Data_Saved : SessionConfigOption_Array_Access := Self.Data;
   begin
      if Self.Length = 0 then
         Self.Is_Null := False;
         Self.Data := new SessionConfigOption_Array (1 .. Init_Length);
      elsif Self.Length = Self.Data'Last then
         Self.Data :=
           new SessionConfigOption_Array (1 .. 3 * Self.Length / 2 + 1);
         Self.Data (1 .. Self.Length) := Self_Data_Saved.all;
         Free (Self_Data_Saved);
      end if;
      Self.Length := Self.Length + 1;
      Self.Data (Self.Length) := Value;
   end Append;

   not overriding
   function Get_SessionConfigOption_Variable_Reference
     (Self : aliased in out SessionConfigOption_Vector; Index : Positive)
      return SessionConfigOption_Variable_Reference
   is (Element => Self.Data (Index)'Access);

   not overriding
   function Get_SessionConfigOption_Constant_Reference
     (Self : aliased SessionConfigOption_Vector; Index : Positive)
      return SessionConfigOption_Constant_Reference
   is (Element => Self.Data (Index)'Access);

   procedure Free is new
     Ada.Unchecked_Deallocation (PlanEntry_Array, PlanEntry_Array_Access);

   overriding
   procedure Adjust (Self : in out PlanEntry_Vector) is
   begin
      if Self.Length > 0 then
         Self.Data := new PlanEntry_Array'(Self.Data (1 .. Self.Length));
      end if;
   end Adjust;

   overriding
   procedure Finalize (Self : in out PlanEntry_Vector) is
   begin
      Free (Self.Data);
      Self.Length := 0;
   end Finalize;

   function Empty return PlanEntry_Vector
   is (Ada.Finalization.Controlled with others => <>);

   function Is_Null (Self : PlanEntry_Vector) return Boolean
   is (Self.Is_Null);

   function Length (Self : PlanEntry_Vector) return Natural
   is (Self.Length);

   procedure Clear (Self : in out PlanEntry_Vector; Is_Null : Boolean := True)
   is
   begin
      Self.Length := 0;
      Self.Is_Null := Is_Null;
   end Clear;

   procedure Append (Self : in out PlanEntry_Vector; Value : PlanEntry) is
      Init_Length     : constant Positive :=
        Positive'Max (2, 256 / PlanEntry'Size);
      Self_Data_Saved : PlanEntry_Array_Access := Self.Data;
   begin
      if Self.Length = 0 then
         Self.Is_Null := False;
         Self.Data := new PlanEntry_Array (1 .. Init_Length);
      elsif Self.Length = Self.Data'Last then
         Self.Data := new PlanEntry_Array (1 .. 3 * Self.Length / 2 + 1);
         Self.Data (1 .. Self.Length) := Self_Data_Saved.all;
         Free (Self_Data_Saved);
      end if;
      Self.Length := Self.Length + 1;
      Self.Data (Self.Length) := Value;
   end Append;

   not overriding
   function Get_PlanEntry_Variable_Reference
     (Self : aliased in out PlanEntry_Vector; Index : Positive)
      return PlanEntry_Variable_Reference
   is (Element => Self.Data (Index)'Access);

   not overriding
   function Get_PlanEntry_Constant_Reference
     (Self : aliased PlanEntry_Vector; Index : Positive)
      return PlanEntry_Constant_Reference
   is (Element => Self.Data (Index)'Access);

   procedure Free is new
     Ada.Unchecked_Deallocation (HttpHeader_Array, HttpHeader_Array_Access);

   overriding
   procedure Adjust (Self : in out HttpHeader_Vector) is
   begin
      if Self.Length > 0 then
         Self.Data := new HttpHeader_Array'(Self.Data (1 .. Self.Length));
      end if;
   end Adjust;

   overriding
   procedure Finalize (Self : in out HttpHeader_Vector) is
   begin
      Free (Self.Data);
      Self.Length := 0;
   end Finalize;

   function Empty return HttpHeader_Vector
   is (Ada.Finalization.Controlled with others => <>);

   function Is_Null (Self : HttpHeader_Vector) return Boolean
   is (Self.Is_Null);

   function Length (Self : HttpHeader_Vector) return Natural
   is (Self.Length);

   procedure Clear (Self : in out HttpHeader_Vector; Is_Null : Boolean := True)
   is
   begin
      Self.Length := 0;
      Self.Is_Null := Is_Null;
   end Clear;

   procedure Append (Self : in out HttpHeader_Vector; Value : HttpHeader) is
      Init_Length     : constant Positive :=
        Positive'Max (2, 256 / HttpHeader'Size);
      Self_Data_Saved : HttpHeader_Array_Access := Self.Data;
   begin
      if Self.Length = 0 then
         Self.Is_Null := False;
         Self.Data := new HttpHeader_Array (1 .. Init_Length);
      elsif Self.Length = Self.Data'Last then
         Self.Data := new HttpHeader_Array (1 .. 3 * Self.Length / 2 + 1);
         Self.Data (1 .. Self.Length) := Self_Data_Saved.all;
         Free (Self_Data_Saved);
      end if;
      Self.Length := Self.Length + 1;
      Self.Data (Self.Length) := Value;
   end Append;

   not overriding
   function Get_HttpHeader_Variable_Reference
     (Self : aliased in out HttpHeader_Vector; Index : Positive)
      return HttpHeader_Variable_Reference
   is (Element => Self.Data (Index)'Access);

   not overriding
   function Get_HttpHeader_Constant_Reference
     (Self : aliased HttpHeader_Vector; Index : Positive)
      return HttpHeader_Constant_Reference
   is (Element => Self.Data (Index)'Access);

   procedure Free is new
     Ada.Unchecked_Deallocation (EnvVariable_Array, EnvVariable_Array_Access);

   overriding
   procedure Adjust (Self : in out EnvVariable_Vector) is
   begin
      if Self.Length > 0 then
         Self.Data := new EnvVariable_Array'(Self.Data (1 .. Self.Length));
      end if;
   end Adjust;

   overriding
   procedure Finalize (Self : in out EnvVariable_Vector) is
   begin
      Free (Self.Data);
      Self.Length := 0;
   end Finalize;

   function Empty return EnvVariable_Vector
   is (Ada.Finalization.Controlled with others => <>);

   function Is_Null (Self : EnvVariable_Vector) return Boolean
   is (Self.Is_Null);

   function Length (Self : EnvVariable_Vector) return Natural
   is (Self.Length);

   procedure Clear
     (Self : in out EnvVariable_Vector; Is_Null : Boolean := True) is
   begin
      Self.Length := 0;
      Self.Is_Null := Is_Null;
   end Clear;

   procedure Append (Self : in out EnvVariable_Vector; Value : EnvVariable) is
      Init_Length     : constant Positive :=
        Positive'Max (2, 256 / EnvVariable'Size);
      Self_Data_Saved : EnvVariable_Array_Access := Self.Data;
   begin
      if Self.Length = 0 then
         Self.Is_Null := False;
         Self.Data := new EnvVariable_Array (1 .. Init_Length);
      elsif Self.Length = Self.Data'Last then
         Self.Data := new EnvVariable_Array (1 .. 3 * Self.Length / 2 + 1);
         Self.Data (1 .. Self.Length) := Self_Data_Saved.all;
         Free (Self_Data_Saved);
      end if;
      Self.Length := Self.Length + 1;
      Self.Data (Self.Length) := Value;
   end Append;

   not overriding
   function Get_EnvVariable_Variable_Reference
     (Self : aliased in out EnvVariable_Vector; Index : Positive)
      return EnvVariable_Variable_Reference
   is (Element => Self.Data (Index)'Access);

   not overriding
   function Get_EnvVariable_Constant_Reference
     (Self : aliased EnvVariable_Vector; Index : Positive)
      return EnvVariable_Constant_Reference
   is (Element => Self.Data (Index)'Access);

   procedure Free is new
     Ada.Unchecked_Deallocation (DiffChange_Array, DiffChange_Array_Access);

   overriding
   procedure Adjust (Self : in out DiffChange_Vector) is
   begin
      if Self.Length > 0 then
         Self.Data := new DiffChange_Array'(Self.Data (1 .. Self.Length));
      end if;
   end Adjust;

   overriding
   procedure Finalize (Self : in out DiffChange_Vector) is
   begin
      Free (Self.Data);
      Self.Length := 0;
   end Finalize;

   function Empty return DiffChange_Vector
   is (Ada.Finalization.Controlled with others => <>);

   function Is_Null (Self : DiffChange_Vector) return Boolean
   is (Self.Is_Null);

   function Length (Self : DiffChange_Vector) return Natural
   is (Self.Length);

   procedure Clear (Self : in out DiffChange_Vector; Is_Null : Boolean := True)
   is
   begin
      Self.Length := 0;
      Self.Is_Null := Is_Null;
   end Clear;

   procedure Append (Self : in out DiffChange_Vector; Value : DiffChange) is
      Init_Length     : constant Positive :=
        Positive'Max (2, 256 / DiffChange'Size);
      Self_Data_Saved : DiffChange_Array_Access := Self.Data;
   begin
      if Self.Length = 0 then
         Self.Is_Null := False;
         Self.Data := new DiffChange_Array (1 .. Init_Length);
      elsif Self.Length = Self.Data'Last then
         Self.Data := new DiffChange_Array (1 .. 3 * Self.Length / 2 + 1);
         Self.Data (1 .. Self.Length) := Self_Data_Saved.all;
         Free (Self_Data_Saved);
      end if;
      Self.Length := Self.Length + 1;
      Self.Data (Self.Length) := Value;
   end Append;

   not overriding
   function Get_DiffChange_Variable_Reference
     (Self : aliased in out DiffChange_Vector; Index : Positive)
      return DiffChange_Variable_Reference
   is (Element => Self.Data (Index)'Access);

   not overriding
   function Get_DiffChange_Constant_Reference
     (Self : aliased DiffChange_Vector; Index : Positive)
      return DiffChange_Constant_Reference
   is (Element => Self.Data (Index)'Access);

   procedure Free is new
     Ada.Unchecked_Deallocation (Integer_64_Array, Integer_64_Array_Access);

   overriding
   procedure Adjust (Self : in out Integer_64_Vector) is
   begin
      if Self.Length > 0 then
         Self.Data := new Integer_64_Array'(Self.Data (1 .. Self.Length));
      end if;
   end Adjust;

   overriding
   procedure Finalize (Self : in out Integer_64_Vector) is
   begin
      Free (Self.Data);
      Self.Length := 0;
   end Finalize;

   function Empty return Integer_64_Vector
   is (Ada.Finalization.Controlled with others => <>);

   function Is_Null (Self : Integer_64_Vector) return Boolean
   is (Self.Is_Null);

   function Length (Self : Integer_64_Vector) return Natural
   is (Self.Length);

   procedure Clear (Self : in out Integer_64_Vector; Is_Null : Boolean := True)
   is
   begin
      Self.Length := 0;
      Self.Is_Null := Is_Null;
   end Clear;

   procedure Append (Self : in out Integer_64_Vector; Value : Integer_64) is
      Init_Length     : constant Positive :=
        Positive'Max (2, 256 / Integer_64'Size);
      Self_Data_Saved : Integer_64_Array_Access := Self.Data;
   begin
      if Self.Length = 0 then
         Self.Is_Null := False;
         Self.Data := new Integer_64_Array (1 .. Init_Length);
      elsif Self.Length = Self.Data'Last then
         Self.Data := new Integer_64_Array (1 .. 3 * Self.Length / 2 + 1);
         Self.Data (1 .. Self.Length) := Self_Data_Saved.all;
         Free (Self_Data_Saved);
      end if;
      Self.Length := Self.Length + 1;
      Self.Data (Self.Length) := Value;
   end Append;

   not overriding
   function Get_Integer_64_Variable_Reference
     (Self : aliased in out Integer_64_Vector; Index : Positive)
      return Integer_64_Variable_Reference
   is (Element => Self.Data (Index)'Access);

   not overriding
   function Get_Integer_64_Constant_Reference
     (Self : aliased Integer_64_Vector; Index : Positive)
      return Integer_64_Constant_Reference
   is (Element => Self.Data (Index)'Access);

   procedure Free is new
     Ada.Unchecked_Deallocation
       (PermissionOption_Array,
        PermissionOption_Array_Access);

   overriding
   procedure Adjust (Self : in out PermissionOption_Vector) is
   begin
      if Self.Length > 0 then
         Self.Data :=
           new PermissionOption_Array'(Self.Data (1 .. Self.Length));
      end if;
   end Adjust;

   overriding
   procedure Finalize (Self : in out PermissionOption_Vector) is
   begin
      Free (Self.Data);
      Self.Length := 0;
   end Finalize;

   function Empty return PermissionOption_Vector
   is (Ada.Finalization.Controlled with others => <>);

   function Is_Null (Self : PermissionOption_Vector) return Boolean
   is (Self.Is_Null);

   function Length (Self : PermissionOption_Vector) return Natural
   is (Self.Length);

   procedure Clear
     (Self : in out PermissionOption_Vector; Is_Null : Boolean := True) is
   begin
      Self.Length := 0;
      Self.Is_Null := Is_Null;
   end Clear;

   procedure Append
     (Self : in out PermissionOption_Vector; Value : PermissionOption)
   is
      Init_Length     : constant Positive :=
        Positive'Max (2, 256 / PermissionOption'Size);
      Self_Data_Saved : PermissionOption_Array_Access := Self.Data;
   begin
      if Self.Length = 0 then
         Self.Is_Null := False;
         Self.Data := new PermissionOption_Array (1 .. Init_Length);
      elsif Self.Length = Self.Data'Last then
         Self.Data :=
           new PermissionOption_Array (1 .. 3 * Self.Length / 2 + 1);
         Self.Data (1 .. Self.Length) := Self_Data_Saved.all;
         Free (Self_Data_Saved);
      end if;
      Self.Length := Self.Length + 1;
      Self.Data (Self.Length) := Value;
   end Append;

   not overriding
   function Get_PermissionOption_Variable_Reference
     (Self : aliased in out PermissionOption_Vector; Index : Positive)
      return PermissionOption_Variable_Reference
   is (Element => Self.Data (Index)'Access);

   not overriding
   function Get_PermissionOption_Constant_Reference
     (Self : aliased PermissionOption_Vector; Index : Positive)
      return PermissionOption_Constant_Reference
   is (Element => Self.Data (Index)'Access);

end ACP.Types;
