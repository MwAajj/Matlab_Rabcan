classdef CovidManager < handle
   
    properties(SetAccess = private)
        patients = [];
        doctors = [];
    end
    
    methods
       
        function obj = CovidManager() 
          
        end
        
        function rePatients = getPatientsByDate(obj, dateFrom, dateTo)
            pomPatients = [];
            for index = 1:length(obj.patients)
                patient = obj.patients(index);
                if isbetween(patient.date, dateFrom, dateTo)
                    pomPatients  = [pomPatients; patient]; 
                end
            end
            rePatients = pomPatients;
        end
        
        function rePatient = getPatientByPersonalNumber(obj, paPersonalNumber)
            for index = 1:length(obj.patients)
                patient = obj.patients(index);
                if patient.personalNumber == paPersonalNumber
                    rePatient = patient;
                end
            end
        end
        
        function isValid = setNegativePatient(obj, paPersonalNumber)
            removeIndex = -1;
            for index = 1:length(obj.patients)
                patient = obj.patients(index);
                if patient.personalNumber == paPersonalNumber
                    removeIndex = index;
                    break;
                end
            end
            if removeIndex ~= -1
                obj.patients(removeIndex).setPositive(false);
                isValid = true;
            else 
                isValid = false;
            end
            
        end
        
        function reDoctor = getDoctorByPersonalNumber(obj, paPersonalNumber)
            reDoctor = [];
            for index = 1:length(obj.doctors)
                doctor = obj.doctors(index);
                if doctor.personalNumber == paPersonalNumber
                    reDoctor = doctor;
                end
            end
        end
        
        function isValid = addDoctor(obj, paDoctor)
            isValid = true;
            for index = 1:length(obj.doctors)
                if(obj.doctors(index).personalNumber ==  paDoctor.personalNumber)
                    isValid = false;
                end
            end
            if(isValid)
                obj.doctors = [obj.doctors; paDoctor];
            end
        end
        
        function reDoctors = get.doctors(obj)
            reDoctors = obj.doctors;
        end
        
        
        function isValid = addPatient(obj, paPatient)
            isValid = true;
            isPom = false;
            for index = 1 : length(obj.patients)
               if(obj.patients(index).personalNumber == paPatient.personalNumber)
                   isPom = true;
                   if(~obj.patients(index).positive)
                        obj.patients(index).setPositive(true);
                        obj.patients(index).setDate(paPatient.date);
                   else
                       isValid = false;
                   end
               end
            end
            if(~isPom)
                obj.patients = [obj.patients; paPatient];
            end  
        end
        
        function rePatients = get.patients(obj)
            rePatients = obj.patients;
        end
        
        function rePatients = getSickPatients(obj)
            for index = 1 : length(obj.patients)
                if(obj.patients(index).positive)
                    rePatients(end +1) = obj.patients(index);
                end
            end
        end
        
        function printPatients(obj) 
            for index = 1:length(obj.patients)
                patient = obj.patients(index);
                disp(patient);
            end
        end
        
        function reNumbers = getNumbersOfCovid(obj) 
            dates = unique([obj.patients.date]);
            reNumbers = zeros(1, length(dates)); 
            for indexDate = 1: length(dates)
                date = dates(indexDate);
                for index = 1:length(obj.patients)
                    patient = obj.patients(index);
                    if (patient.date == date)
                        reNumbers(indexDate) = reNumbers(indexDate) + 1;
                    end
                end
            end
        end
        
        function reBonus = getNumbersOfBonus(obj)
            reBonus = [obj.doctors.bonus];
        end
        
        function reDates = getDates(obj)
            reDates = unique([obj.patients.date]);
        end
        
        
        function save(obj)
            file = 'file.mat';
            patientsFile = obj.patients;
            doctorsFile = obj.doctors;
            save(file, 'patientsFile', 'doctorsFile');
        end
        
        function load(obj)
            loadFile = load('file.mat', 'patientsFile', 'doctorsFile');
            obj.patients = loadFile.patientsFile;
            obj.doctors = loadFile.doctorsFile;
        end
    end
end

