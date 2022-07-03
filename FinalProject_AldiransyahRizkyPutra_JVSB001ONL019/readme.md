
# FINAL PROJECT

- Nama          : Aldiransyah Rizky Putra
- Kode Peserta  : JVSB001ONL019
- Link GitHub   : https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/tree/main/sesi_23_final_project




### Deskripsi Singkat 
Final Project ini merupakan sesi ke-23 dari materi Java Spring Boot. Final Project ini menjelaskan tentang pembuatan Rest API pada sistem aplikasi Bus, dimana suatu user admin dapat melakukan proses CRUD di setiap modul yang ada pada aplikasi.
Modul-modul tersebut terdiri dari :
- User
- Auth
- Agency
- Bus
- Trip Schedule
- Trip
- Ticket
- Stop



## Project Dependencies
- Spring Boot Starter Data JPA
- Spring Boot Starter Security
- Spring Boot Starter Web
- Spring Boot DevTools
- Spring Boot Starter Test
- Spring Boot Security Test
- MYSQL Connector Java
- JJWT ver. 0.9.1
- Springfox Swagger2 ver. 2.7.0
- Springfox SwaggerUI ver. 2.7.0
- Flyway Core
## How To Use (API Reference)

Penggunaan API dapat dilakukan dengan melakukan perintah dibawah dengan menggunakan Swagger atau Postman.
## User API

Note : Untuk POST dan PUT dibutuhkan struktur body sebagai berikut :

| Attributes  | Data Type |
| ------------- | ------------- |
| code  | String  |
| details  | String  |
| email  | String  |
| firstName  | String  |
| lastName  | String  |
| mobileNumber  | String  |
| name  | String  |
| password | String  |
| role  | String  |
| username  | String  |


### Register User/SignUp

```http
  POST http://localhost:8080/api/v1/user/signup
```

### UpdateUser
```http
  PUT http://localhost:8080/api/v1/user/{id}
```
Membutuhkan parameter id sebagai berikut:
| Attributes  | Data Type |
| ------------- | ------------- |
| id  | long  |

### UpdatePassword
```http
  PUT http://localhost:8080/api/v1/password/{id}
```
Membutuhkan parameter id sebagai berikut:
| Attributes  | Data Type |
| ------------- | ------------- |
| id  | long  |




## Auth API

Membutuhkan struktur body seperti berikut:

| Attributes  | Data Type |
| ------------- | ------------- |
| password  | String  |
| username | String  |


### Authentication/Login

```http
  POST http://localhost:8080/api/auth
```
Note : Setelah dijalankan, maka Bearer token akan di generate. Masukkan bearer token tersebut pada Authorization.
## Agency API

Note : Untuk POST dan PUT dibutuhkan struktur body sebagai berikut : 
| Attributes  | Data Type |
| ------------- | ------------- |
| code  | String  |
| details  | String  |
| name  | String  |
| owner  | Long  |

### Get All Agency
```http
  GET http://localhost:8080/api/v1/agency/
```
### Get Agency By Id
```http
  GET http://localhost:8080/api/v1/agency/{id}
```
Membutuhkan parameter id sebagai berikut:
| Attributes  | Data Type |
| ------------- | ------------- |
| id  | long  |

### Add Agency
```http
  POST http://localhost:8080/api/v1/agency/
```
### Update Agency
```http
  PUT http://localhost:8080/api/v1/agency/{id}
```
Membutuhkan parameter id sebagai berikut:
| Attributes  | Data Type |
| ------------- | ------------- |
| id  | long  |

### Delete Agency By Id
```http
  DELETE http://localhost:8080/api/v1/agency/{id}
```
Membutuhkan parameter id sebagai berikut:
| Attributes  | Data Type |
| ------------- | ------------- |
| id  | long  |


## Bus API
Note : Untuk POST dan PUT dibutuhkan struktur body sebagai berikut : 
| Attributes  | Data Type |
| ------------- | ------------- |
| capacity  | Long  |
| code  | String  |
| make  | String  |

### Get All Bus
```http
  GET http://localhost:8080/api/v1/bus/
```
### Get Bus By Agency Id
```http
  GET http://localhost:8080/api/v1/bus/{id}
```
Membutuhkan parameter id sebagai berikut:
| Attributes  | Data Type |
| ------------- | ------------- |
| id  | long  |

### Add Bus By Agency Id
```http
  POST http://localhost:8080/api/v1/bus/{id}
```
Membutuhkan parameter id sebagai berikut:
| Attributes  | Data Type |
| ------------- | ------------- |
| id  | long  |

### Update Bus
```http
  PUT http://localhost:8080/api/v1/bus/{id}
```
Membutuhkan parameter id sebagai berikut:
| Attributes  | Data Type |
| ------------- | ------------- |
| id  | long  |

### Delete Bus
```http
  DELETE http://localhost:8080/api/v1/bus/{id}
```
Membutuhkan parameter id sebagai berikut:
| Attributes  | Data Type |
| ------------- | ------------- |
| id  | long  |

## Trip Schedule API

Note : Untuk POST dan PUT dibutuhkan struktur body sebagai berikut : 
| Attributes  | Data Type |
| ------------- | ------------- |
| available_seats  | int  |
| available_seats  | String  |
| trip_detail  | long  |

### Get All Trip Schedule
```http
  GET http://localhost:8080/api/v1/trip_schedule/
```
### Get Trip Schedule By Id
```http
  GET http://localhost:8080/api/v1/trip_schedule/{id}
```
Membutuhkan parameter id sebagai berikut:
| Attributes  | Data Type |
| ------------- | ------------- |
| id  | long  |

### Add Trip Schedule
```http
  POST http://localhost:8080/api/v1/trip_schedule/
```
### Update Trip Schedule
```http
  PUT http://localhost:8080/api/v1/trip_schedule/{id}
```
Membutuhkan parameter id sebagai berikut:
| Attributes  | Data Type |
| ------------- | ------------- |
| id  | long  |

### Delete Trip Schedule
```http
  DELETE http://localhost:8080/api/v1/trip_schedule/{id}
```
Membutuhkan parameter id sebagai berikut:
| Attributes  | Data Type |
| ------------- | ------------- |
| id  | long  |

## Trip API

Note : Untuk POST dan PUT dibutuhkan struktur body sebagai berikut : 
| Attributes  | Data Type |
| ------------- | ------------- |
| agencyId  | long  |
| busId  | long  |
| destStopId  | long  |
| fare  | int  |
| journeyTime  | int  |
| sourceStopId  | long  |

### Get All Trip
```http
  GET http://localhost:8080/api/v1/trip/
```
### Get Trip By Agency Id
```http
  GET http://localhost:8080/api/v1/trip/{id}
```
Membutuhkan parameter id sebagai berikut:
| Attributes  | Data Type |
| ------------- | ------------- |
| id  | long  |

### Add Trip 
```http
  POST http://localhost:8080/api/v1/trip/
```
### Update Trip
```http
  PUT http://localhost:8080/api/v1/trip/{id}
```
Membutuhkan parameter id sebagai berikut:
| Attributes  | Data Type |
| ------------- | ------------- |
| id  | long  |

### Delete Trip
```http
  DELETE http://localhost:8080/api/v1/trip/{id}
```
Membutuhkan parameter id sebagai berikut:
| Attributes  | Data Type |
| ------------- | ------------- |
| id  | long  |

## Ticket API

Note : Untuk POST dan PUT dibutuhkan struktur body sebagai berikut : 
| Attributes  | Data Type |
| ------------- | ------------- |
| cancellable  | Booelan  |
| journeyDate  | String |
| passegerId  | long  |
| seatNumber  | int  |
| tripScheduleId  | long  |

### Get All Ticket
```http
  GET http://localhost:8080/api/v1/ticket/
```
### Get Ticket By Id
```http
  GET http://localhost:8080/api/v1/ticket/{id}
```
Membutuhkan parameter id sebagai berikut:
| Attributes  | Data Type |
| ------------- | ------------- |
| id  | long  |

### Add Ticket
```http
  POST http://localhost:8080/api/v1/ticket/
```
### Update Ticket
```http
  PUT http://localhost:8080/api/v1/ticket/{id}
```
Membutuhkan parameter id sebagai berikut:
| Attributes  | Data Type |
| ------------- | ------------- |
| id  | long  |

### Delete Ticket
```http
  DELETE http://localhost:8080/api/v1/ticket/{id}
```
Membutuhkan parameter id sebagai berikut:
| Attributes  | Data Type |
| ------------- | ------------- |
| id  | long  |

## Stop API

Note : Untuk POST dan PUT dibutuhkan struktur body sebagai berikut : 
| Attributes  | Data Type |
| ------------- | ------------- |
| code  | String  |
| detail  | String |
| id  | long  |
| name  | String  |

### Get All Stops
```http
  GET http://localhost:8080/api/v1/stop/
```
### Get Stop By Code
```http
  GET http://localhost:8080/api/v1/stop/code/{code}
```
Membutuhkan parameter id sebagai berikut:
| Attributes  | Data Type |
| ------------- | ------------- |
| code  | String  |


### Get Stop By Name
```http
  GET http://localhost:8080/api/v1/stop/name/{name}
```
Membutuhkan parameter id sebagai berikut:
| Attributes  | Data Type |
| ------------- | ------------- |
| name  | String  |


### Get Stop By Id
```http
  GET http://localhost:8080/api/v1/stop/{id}
```
Membutuhkan parameter id sebagai berikut:
| Attributes  | Data Type |
| ------------- | ------------- |
| id  | long  |

### Add Stop
```http
  POST http://localhost:8080/api/v1/stop/
```
### Delete Stop
```http
  DELETE http://localhost:8080/api/v1/stop{id}
```
Membutuhkan parameter id sebagai berikut:
| Attributes  | Data Type |
| ------------- | ------------- |
| id  | long  |

## Screenshots (Postman)

### User Screenshots
- Register User
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/User/SignUpAsAdmin.png?raw=true)
- Update User
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/User/UpdateUser.png?raw=true)
- Update Password
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/User/UpdatePassword.png?raw=true)

### Auth Screenshots
- Login/Authentication
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Auth/Auth%20ID%203.png?raw=true)

### Agency Screenshots
- Get All Agency
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Agency/Get%20All%20Agency.png?raw=true)
- Get Agency By ID
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Agency/Get%20Agency%20By%20ID.png?raw=true)
- Add Agency
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Agency/Add%20Agency.png?raw=true)
- Update Agency
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Agency/Update%20Agency.png?raw=true)
- Delete Agency
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Agency/Delete%20Agency.png?raw=true)

### Bus Screenshots
- Get All Bus
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Bus/Get%20All%20Bus.png?raw=true)
- Get Bus By Agency ID
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Bus/Get%20Bus%20By%20Agency%20Id.png?raw=true)
- Add Bus By Agency ID
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Bus/Add%20Bus%20By%20Agency%20ID.png?raw=true)
- Update Bus By Agency ID
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Bus/UpdateBusByAgencyID.png?raw=true)
- Delete Bus
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Bus/Delete%20Bus.png?raw=true)

### Trip Schedule Screenshots
- Get All Trip Schedule
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Trip%20Schedule/Get%20All%20Trip%20Schedule.png?raw=true)
- Get Trip Schedule By ID
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Trip%20Schedule/Get%20Trip%20Schedule%20By%20ID.png?raw=true)
- Add Trip Schedule
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Trip%20Schedule/Add%20Trip%20Schedule.png?raw=true)
- Update Trip Schedule
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Trip%20Schedule/Update%20Trip%20Schedule.png?raw=true)
- Delete Trip Schedule
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Trip%20Schedule/Delete%20Trip%20Schedule.png?raw=true)

### Trip Screenshots
- Get All Trip 
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Trip/Get%20All%20Trip.png?raw=true)
- Get Trip By Agency ID
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Trip/Get%20Trip%20By%20Agency%20ID.png?raw=true)
- Add Trip 
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Trip/Add%20trip.png?raw=true)
- Update Trip 
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Trip/Update%20Trip.png?raw=true)
- Delete Trip 
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Trip/Delete%20Trip.png?raw=true)

### Ticket Screenshots
- Get All Ticket
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Ticket/Get%20All%20Ticket.png?raw=true)
- Get Ticket By ID
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Ticket/Get%20Ticket%20By%20ID.png?raw=true)
- Add Ticket
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Ticket/Add%20ticket.png?raw=true)
- Update Ticket
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Ticket/Update%20Ticket.png?raw=true)
- Delete Ticket 
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Ticket/Delete%20Ticket.png?raw=true)

### Stop Screenshots
- Get All Stop
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Stop/Get%20All%20Stop.png?raw=true)
- Get Stop By ID
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Stop/Get%20Stop%20By%20ID.png?raw=true)
- Get Stop By Code
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Stop/Get%20Stop%20By%20Code.png?raw=true)
- Get Stop By Name
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Stop/Get%20Stop%20by%20Name.png?raw=true)
- Add Stop
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Stop/Add%20Stop.png?raw=true)
- Delete Stop
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Postman/Stop/Delete%20Stop.png?raw=true)
## Screenshot (Swagger)

### User Screenshots
- Register User
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/User/Sign%20Up%20(JohnDoe)%20Role%20User.png?raw=true)
- Update User
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/User/Update%20User.png?raw=true)
- Update Password
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/User/Update%20Password.png?raw=true)

### Auth Screenshots
- Login/Authentication
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Auth/Auth%20as%20John%20Doe%20(with%20new%20password).png?raw=true)

### Agency Screenshots
- Get All Agency
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Agency/Get%20All%20Agency.png?raw=true)
- Get Agency By ID
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Agency/Get%20Agency%20By%20ID.png?raw=true)
- Add Agency
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Agency/Add%20Agency.png?raw=true)
- Update Agency
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Agency/Update%20Agency.png?raw=true)
- Delete Agency
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Agency/delete%20agency.png?raw=true)

### Bus Screenshots
- Get All Bus
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Bus/Get%20All%20Bus.png?raw=true)
- Get Bus By Agency ID
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Bus/Get%20Bus%20by%20Agency%20ID.png?raw=true)
- Add Bus By Agency ID
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Bus/Add%20Bus%20By%20Agency.png?raw=true)
- Update Bus By Agency ID
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Bus/UpdateBusByAgencyID.png?raw=true)
- Delete Bus
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Bus/Delete%20Bus.png?raw=true)

### Trip Schedule Screenshots
- Get All Trip Schedule
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Trip%20Schedule/Get%20All%20Trip%20Schedule.png?raw=true)
- Get Trip Schedule By ID
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Trip%20Schedule/Get%20Trip%20Schedule%20By%20ID.png?raw=true)
- Add Trip Schedule
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Trip%20Schedule/Add%20Trip%20Schedule.png?raw=true)
- Update Trip Schedule
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Trip%20Schedule/Update%20Trip%20Schedule.png?raw=true)
- Delete Trip Schedule
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Trip%20Schedule/Delete%20Trip%20Schedule.png?raw=true)

### Trip Screenshots
- Get All Trip 
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Trip/Get%20All%20trip.png?raw=true)
- Get Trip By Agency ID
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Trip/GEt%20Trip%20By%20Agency%20ID.png?raw=true)
- Add Trip 
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Trip/Add%20Trip.png?raw=true)
- Update Trip 
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Trip/Update%20Trip.png?raw=true)
- Delete Trip 
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Trip/Delete%20Trip.png?raw=true)

### Ticket Screenshots
- Get All Ticket
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Ticket/Get%20All%20Ticket.png?raw=true)
- Get Ticket By ID
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Ticket/Get%20Ticket%20By%20ID.png?raw=true)
- Add Ticket
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Ticket/Add%20Ticket.png?raw=true)
- Update Ticket
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Ticket/UpdateTicket.png?raw=true)
- Delete Ticket 
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Ticket/Delete%20Ticket.png?raw=true)


### Stop Screenshots
- Get All Stop
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Stop/Get%20All%20Stop.png?raw=true)
- Get Stop By ID
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Stop/Get%20Stop%20By%20ID.png?raw=true)
- Get Stop By Code
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Stop/Get%20Stop%20by%20Code.png?raw=true)
- Get Stop By Name
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Stop/Get%20Stop%20By%20Name.png?raw=true)
- Add Stop
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Stop/Add%20Stop.png?raw=true)
- Delete Stop
![App Screenshot](https://github.com/aldirarizkyp/Belajar_Springboot_Hacktiv8/blob/main/sesi_23_final_project/Screenshot/Swagger/Stop/Delete%20Stop.png?raw=true)
