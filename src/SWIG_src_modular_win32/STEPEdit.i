/*
##Copyright 2008-2009 Thomas Paviot
##
##thomas.paviot@free.fr
##
##pythonOCC is a computer program whose purpose is to provide a complete set
##of python bindings for OpenCascade library.
##
##This software is governed by the CeCILL license under French law and
##abiding by the rules of distribution of free software.  You can  use, 
##modify and/ or redistribute the software under the terms of the CeCILL
##license as circulated by CEA, CNRS and INRIA at the following URL
##"http://www.cecill.info". 
##
##As a counterpart to the access to the source code and  rights to copy,
##modify and redistribute granted by the license, users are provided only
##with a limited warranty  and the software's author,  the holder of the
##economic rights,  and the successive licensors  have only  limited
##liability. 
##
##In this respect, the user's attention is drawn to the risks associated
##with loading,  using,  modifying and/or developing or reproducing the
##software by the user in light of its specific status of free software,
##that may mean  that it is complicated to manipulate,  and  that  also
##therefore means  that it is reserved for developers  and  experienced
##professionals having in-depth computer knowledge. Users are therefore
##encouraged to load and test the software's suitability as regards their
##requirements in conditions enabling the security of their systems and/or 
##data to be ensured and,  more generally, to use and operate it in the 
##same conditions as regards security. 
##
##The fact that you are presently reading this means that you have had
##knowledge of the CeCILL license and that you accept its terms.
*/
%module STEPEdit

%include typemaps.i
%include cmalloc.i
%include cpointer.i
%include carrays.i
%include exception.i

#ifndef _Standard_TypeDef_HeaderFile
#define _Standard_TypeDef_HeaderFile
#define Standard_False (Standard_Boolean) 0
#define Standard_True  (Standard_Boolean) 1
#endif

/*
Exception handling
*/
%{#include <Standard_Failure.hxx>%}
%exception
{
    try
    {
        $action
    } 
    catch(Standard_Failure)
    {
        SWIG_exception(SWIG_RuntimeError,Standard_Failure::Caught()->DynamicType()->Name());
    }
}

/*
Standard_Real & function transformation
*/
%typemap(argout) Standard_Real &OutValue {
    PyObject *o, *o2, *o3;
    o = PyFloat_FromDouble(*$1);
    if ((!$result) || ($result == Py_None)) {
        $result = o;
    } else {
        if (!PyTuple_Check($result)) {
            PyObject *o2 = $result;
            $result = PyTuple_New(1);
            PyTuple_SetItem($result,0,o2);
        }
        o3 = PyTuple_New(1);
        PyTuple_SetItem(o3,0,o);
        o2 = $result;
        $result = PySequence_Concat(o2,o3);
        Py_DECREF(o2);
        Py_DECREF(o3);
    }
}

%typemap(in,numinputs=0) Standard_Real &OutValue(Standard_Real temp) {
    $1 = &temp;
}


%include STEPEdit_dependencies.i


%include STEPEdit_headers.i




%nodefaultctor Handle_STEPEdit_EditSDR;
class Handle_STEPEdit_EditSDR : public Handle_IFSelect_Editor {
	public:
		%feature("autodoc", "1");
		~Handle_STEPEdit_EditSDR();
		%feature("autodoc", "1");
		Handle_STEPEdit_EditSDR();
		%feature("autodoc", "1");
		Handle_STEPEdit_EditSDR(const Handle_STEPEdit_EditSDR &aHandle);
		%feature("autodoc", "1");
		Handle_STEPEdit_EditSDR(const STEPEdit_EditSDR *anItem);
		%feature("autodoc", "1");
		Handle_STEPEdit_EditSDR const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_STEPEdit_EditSDR {
	STEPEdit_EditSDR* GetObject() {
	return (STEPEdit_EditSDR*)$self->Access();
	}
};

%nodefaultctor Handle_STEPEdit_EditContext;
class Handle_STEPEdit_EditContext : public Handle_IFSelect_Editor {
	public:
		%feature("autodoc", "1");
		~Handle_STEPEdit_EditContext();
		%feature("autodoc", "1");
		Handle_STEPEdit_EditContext();
		%feature("autodoc", "1");
		Handle_STEPEdit_EditContext(const Handle_STEPEdit_EditContext &aHandle);
		%feature("autodoc", "1");
		Handle_STEPEdit_EditContext(const STEPEdit_EditContext *anItem);
		%feature("autodoc", "1");
		Handle_STEPEdit_EditContext const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_STEPEdit_EditContext {
	STEPEdit_EditContext* GetObject() {
	return (STEPEdit_EditContext*)$self->Access();
	}
};

%nodefaultctor STEPEdit;
class STEPEdit {
	public:
		%feature("autodoc", "1");
		~STEPEdit();
		%feature("autodoc", "1");
		STEPEdit();
		%feature("autodoc", "1");
		Handle_Interface_Protocol Protocol();
		%feature("autodoc", "1");
		Handle_StepData_StepModel NewModel();
		%feature("autodoc", "1");
		Handle_IFSelect_Signature SignType();
		%feature("autodoc", "1");
		Handle_IFSelect_SelectSignature NewSelectSDR();
		%feature("autodoc", "1");
		Handle_IFSelect_SelectSignature NewSelectPlacedItem();
		%feature("autodoc", "1");
		Handle_IFSelect_SelectSignature NewSelectShapeRepr();

};

%nodefaultctor STEPEdit_EditContext;
class STEPEdit_EditContext : public IFSelect_Editor {
	public:
		%feature("autodoc", "1");
		STEPEdit_EditContext();
		%feature("autodoc", "1");
		virtual		TCollection_AsciiString Label() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Recognize(const Handle_IFSelect_EditForm &form) const;
		%feature("autodoc", "1");
		virtual		Handle_TCollection_HAsciiString StringValue(const Handle_IFSelect_EditForm &form, const Standard_Integer num) const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Apply(const Handle_IFSelect_EditForm &form, const Handle_Standard_Transient &ent, const Handle_Interface_InterfaceModel &model) const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Load(const Handle_IFSelect_EditForm &form, const Handle_Standard_Transient &ent, const Handle_Interface_InterfaceModel &model) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~STEPEdit_EditContext();

};
%extend STEPEdit_EditContext {
	Handle_STEPEdit_EditContext GetHandle() {
	return *(Handle_STEPEdit_EditContext*) &$self;
	}
};

%nodefaultctor STEPEdit_EditSDR;
class STEPEdit_EditSDR : public IFSelect_Editor {
	public:
		%feature("autodoc", "1");
		STEPEdit_EditSDR();
		%feature("autodoc", "1");
		virtual		TCollection_AsciiString Label() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Recognize(const Handle_IFSelect_EditForm &form) const;
		%feature("autodoc", "1");
		virtual		Handle_TCollection_HAsciiString StringValue(const Handle_IFSelect_EditForm &form, const Standard_Integer num) const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Apply(const Handle_IFSelect_EditForm &form, const Handle_Standard_Transient &ent, const Handle_Interface_InterfaceModel &model) const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean Load(const Handle_IFSelect_EditForm &form, const Handle_Standard_Transient &ent, const Handle_Interface_InterfaceModel &model) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~STEPEdit_EditSDR();

};
%extend STEPEdit_EditSDR {
	Handle_STEPEdit_EditSDR GetHandle() {
	return *(Handle_STEPEdit_EditSDR*) &$self;
	}
};