package com.bezkoder.spring.security.modules.login.controllers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Random;
import java.util.Set;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bezkoder.spring.security.modules.login.services.ConsultationService;
import com.bezkoder.spring.security.modules.login.services.DoctorService;
import com.bezkoder.spring.security.modules.login.services.InterpreterService;
import com.bezkoder.spring.security.modules.login.services.PatientService;
import com.bezkoder.spring.security.modules.login.models.Consultation;
import com.bezkoder.spring.security.modules.login.models.Doctor;
import com.bezkoder.spring.security.modules.login.models.Exams;
import com.bezkoder.spring.security.modules.login.models.Interpreter;
import com.bezkoder.spring.security.modules.login.models.Medication;
import com.bezkoder.spring.security.modules.login.models.Patient;
import com.bezkoder.spring.security.modules.login.payload.ConsultationDTO;
import com.bezkoder.spring.security.modules.login.payload.CreateConsultationDTO;
import com.bezkoder.spring.security.modules.login.payload.ExamsDTO;
import com.bezkoder.spring.security.modules.login.payload.MedicationDTO;
import com.bezkoder.spring.security.modules.login.repository.MedicationRepository;


@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/consultation")
public class ConsultationController 
{
    @Autowired
    ConsultationService ConsultationService;

    @Autowired
    DoctorService doctorService;

    @Autowired
    InterpreterService interpreterService;

    @Autowired
    PatientService patientService;

    @Autowired
    MedicationRepository medicationRepository;

    @GetMapping("/all")
    @PreAuthorize("hasRole('ROOT')")
    public ResponseEntity<List<CreateConsultationDTO>> getAll(@PageableDefault(page = 0, size = 10, sort = "id") Pageable pageable)
    {
        var consultationsAll = ConsultationService.findAll();
        
        List<CreateConsultationDTO> consultationList = new ArrayList<>();

        for(Consultation consult : consultationsAll) 
        {
            CreateConsultationDTO consultObj = new CreateConsultationDTO
            ( 
               consult.getState(), consult.getDescription(), consult.getDate(), consult.getDoctor(), consult.getPatient(), 
               consult.getInterpreter()
            );

            consultationList.add(consultObj);    
        }


        return ResponseEntity.status(HttpStatus.OK).body( consultationList );
    }

    
    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('ROOT')")
    public ResponseEntity<Object> delet(@PathVariable(value = "id") long id)
    {
        Optional<Consultation> Consultation = ConsultationService.findById( id );
        
        if (!Consultation.isPresent())
        {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Consultation not found.");
        }

        ConsultationService.delete(Consultation.get());

        return ResponseEntity.status(HttpStatus.OK).body("Consultation deleted successfully.");
    }

    @GetMapping("/{id}")
    @PreAuthorize("hasRole('ROOT') OR hasRole('DOCTOR') OR hasRole('PATIENT') OR hasRole('INTERPRETER') ")
    public ResponseEntity<Object> getById(@PathVariable(value = "id") long id)
    {
        Optional<Consultation> Consultation = ConsultationService.findById( id );
        
        if (!Consultation.isPresent())
        {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Consultation not found.");
        }

        ConsultationDTO ConsultationDTO = new ConsultationDTO(Consultation.get().getState(), 
        Consultation.get().getDescription(), Consultation.get().getDate(), Consultation.get().getDoctor(), Consultation.get().getPatient(), 
        Consultation.get().getInterpreter(), Consultation.get().getMedications(), Consultation.get().getExams() );
        
        
        return ResponseEntity.status(HttpStatus.OK).body(ConsultationDTO);
    }

    @PostMapping("/addMedication/{id}")
    @PreAuthorize("hasRole('ROOT') OR hasRole('DOCTOR')")
    public ResponseEntity<Object> addMedication(@PathVariable(value = "id") long id, @Valid @RequestBody MedicationDTO medicationDTO)
    {
        Optional<Consultation> Consultation = ConsultationService.findById( id );
        
        if (!Consultation.isPresent())
        {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Consultation not found.");
        }

        var medicationEntities = new Medication();
        BeanUtils.copyProperties( medicationDTO, medicationEntities);  

        Random random = new Random();
        long idMedication = random.nextLong();  

        medicationEntities.setId( idMedication );


        Set<Medication> medications = new HashSet<>();
        Set<Medication> medicationsOld = Consultation.get().getMedications();

        medicationsOld.forEach( medicationOLD -> 
        {
            medications.add( medicationOLD );
        });

        medications.add(medicationEntities);
     
         
        var ConsultationEntities = Consultation.get();
        ConsultationEntities.setMedications( medications );

        ConsultationService.save( ConsultationEntities );
         
        return ResponseEntity.status(HttpStatus.OK).body(   ConsultationEntities  );
    }

    @PostMapping("/addExams/{id}")   
    @PreAuthorize("hasRole('ROOT') OR hasRole('DOCTOR')")
    public ResponseEntity<Object> addExams(@PathVariable(value = "id") long id, @Valid @RequestBody ExamsDTO examsDTO)
    {
        Optional<Consultation> Consultation = ConsultationService.findById( id );
        
        if (!Consultation.isPresent())
        {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Consultation not found.");
        }

        var examsEntities = new Exams();
        BeanUtils.copyProperties( examsDTO, examsEntities);  

        Random random = new Random();
        long idExams = random.nextLong();  

        examsEntities.setId( idExams );

        Set<Exams> exams = new HashSet<>();
        Set<Exams> examsOld = Consultation.get().getExams();

        examsOld.forEach( examsOLD -> 
        {
            exams.add( examsOLD );
        });

        exams.add(examsEntities);
     
         
        var ConsultationEntities = Consultation.get();
        ConsultationEntities.setExams( exams );

        ConsultationService.save( ConsultationEntities );
         
        return ResponseEntity.status(HttpStatus.OK).body(   ConsultationEntities  );
    }

    @GetMapping("/doctor/{crm}/{state}")
    @PreAuthorize("hasRole('ROOT') OR hasRole('DOCTOR')")
    public ResponseEntity<Object> getByDoctor(@PathVariable(value = "state") String state,@PathVariable(value = "crm") String crm )
    {
        var consultationsAll = ConsultationService.findAll();
        
        List<ConsultationDTO> consultationList = new ArrayList<>();

        for(Consultation consult : consultationsAll) 
        {
            if( ( consult.getDoctor().getCrm().equals(crm) ) && ( consult.getState().equals(state) ) )  
            {
                ConsultationDTO consultObj = new ConsultationDTO
                ( 
                    consult.getState(), consult.getDescription(), consult.getDate(), consult.getDoctor(), consult.getPatient(), 
                    consult.getInterpreter(), consult.getMedications(), consult.getExams()
                );

                consultationList.add(consultObj); 
            }   
        }


        return ResponseEntity.status(HttpStatus.OK).body( consultationList );
    }

    @GetMapping("/patient/{cpf}/{state}")
    @PreAuthorize("hasRole('ROOT') OR hasRole('PATIENT')")
    public ResponseEntity<Object> getByPatient(@PathVariable(value = "state") String state,@PathVariable(value = "cpf") String cpf )
    {
        var consultationsAll = ConsultationService.findAll();
        
        List<ConsultationDTO> consultationList = new ArrayList<>();

        for(Consultation consult : consultationsAll) 
        {
            if( ( consult.getPatient().getCpf().equals(cpf) ) && ( consult.getState().equals(state) ) )  
            {
                ConsultationDTO consultObj = new ConsultationDTO
                ( 
                    consult.getState(), consult.getDescription(), consult.getDate(), consult.getDoctor(), consult.getPatient(), 
                    consult.getInterpreter(), consult.getMedications(), consult.getExams()
                );

                consultationList.add(consultObj); 
            }   
        }


        return ResponseEntity.status(HttpStatus.OK).body( consultationList );
    }

    @GetMapping("/interpreter/{cpf}/{state}")
    @PreAuthorize("hasRole('ROOT') OR hasRole('INTERPRETER') ")
    public ResponseEntity<Object> getByInterpreter(@PathVariable(value = "state") String state,@PathVariable(value = "cpf") String cpf )
    {
        var consultationsAll = ConsultationService.findAll();
        
        List<CreateConsultationDTO> consultationList = new ArrayList<>();

        for(Consultation consult : consultationsAll) 
        {
            if( ( consult.getInterpreter().getCpf().equals(cpf) ) && ( consult.getState().equals(state) ) )  
            {
                CreateConsultationDTO consultObj = new CreateConsultationDTO
                ( 
                    consult.getState(), consult.getDescription(), consult.getDate(), consult.getDoctor(), consult.getPatient(), 
                    consult.getInterpreter()
                );

                consultationList.add(consultObj); 
            }   
        }


        return ResponseEntity.status(HttpStatus.OK).body( consultationList );
    }

    @PostMapping("add")
    @PreAuthorize("hasRole('ROOT') OR hasRole('DOCTOR')")
    public ResponseEntity<Object> save(@Valid @RequestBody CreateConsultationDTO ConsultationDTO)
    {
        
        String[] state = {"0", "1"};

        Optional<Doctor> doctor = doctorService.findById( ConsultationDTO.getDoctor().getId() );
        Optional<Patient> patient = patientService.findById( ConsultationDTO.getPatient().getId() );
        Optional<Interpreter> interpreter = interpreterService.findById( ConsultationDTO.getInterpreter().getId() );

        if (!doctor.isPresent()) 
        {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("doctor not found.");
        }

        if (!patient.isPresent()) 
        {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("patient not found.");
        }
        
        if (!interpreter.isPresent()) 
        {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("interpreter not found.");
        }

        if( !Arrays.asList( state ).contains( ConsultationDTO.getState() )  )
        {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
            .body("state not found. Estados validas [ 0, 1]");
        }
      
        var ConsultationEntities = new Consultation();
        BeanUtils.copyProperties( ConsultationDTO, ConsultationEntities);  
  
        Doctor doctorEntities = new Doctor( doctor.get().getId(), doctor.get().getName(), doctor.get().getCrm(), doctor.get().getUser(), doctor.get().getSpecialty() );
        Patient patientEntities = new Patient( patient.get().getId(), patient.get().getName(), patient.get().getCpf(), patient.get().getUser() );
        Interpreter interpreterEntities = new Interpreter( interpreter.get().getId() ,interpreter.get().getName(), interpreter.get().getCpf(), interpreter.get().getUser() );

        ConsultationEntities.setDoctor(doctorEntities);
        ConsultationEntities.setPatient(patientEntities);
        ConsultationEntities.setInterpreter(interpreterEntities);

        ConsultationService.save( ConsultationEntities );
  
        return ResponseEntity.status(HttpStatus.CREATED).body( ConsultationEntities );
    }   
  
    @PutMapping("{id}")
    @PreAuthorize("hasRole('ROOT') OR hasRole('DOCTOR')")
    public ResponseEntity<Object> edit(@PathVariable(value = "id") long id,@Valid @RequestBody CreateConsultationDTO ConsultationDTO)
    {
        
        String[] state = { "1"};

        Optional<Doctor> doctor = doctorService.findById( ConsultationDTO.getDoctor().getId() );
        Optional<Patient> patient = patientService.findById( ConsultationDTO.getPatient().getId() );
        Optional<Interpreter> interpreter = interpreterService.findById( ConsultationDTO.getInterpreter().getId() );
        Optional<Consultation> consult = ConsultationService.findById( id );

        if (!doctor.isPresent()) 
        {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("doctor not found.");
        }

        if (!patient.isPresent()) 
        {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("patient not found.");
        }
        
        if (!interpreter.isPresent()) 
        {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("interpreter not found.");
        }

        if (!consult.isPresent()) 
        {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("consult not found.");
        }

        if( !Arrays.asList( state ).contains( ConsultationDTO.getState() )  )
        {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
            .body("state not found. Estados validas [ 1]");
        }
      
        var ConsultationEntities = new Consultation();
        BeanUtils.copyProperties( ConsultationDTO, ConsultationEntities);  
        ConsultationEntities.setId( consult.get().getId() );
        ConsultationEntities.setState("0");
         

        ConsultationService.save( ConsultationEntities );
  
        return ResponseEntity.status(HttpStatus.CREATED).body( ConsultationEntities );
    }   
    
}
