package com.aldiransyah.bus.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.aldiransyah.bus.model.Ticket;

public interface TicketRepository extends JpaRepository<Ticket, Long> {

}
