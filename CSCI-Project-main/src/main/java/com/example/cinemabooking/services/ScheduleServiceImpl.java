package com.example.cinemabooking.services;

import com.example.cinemabooking.entities.Schedule;
import com.example.cinemabooking.repository.ScheduleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScheduleServiceImpl implements ScheduleService {
    @Autowired
    private ScheduleRepository scheduleRepository;

    @Override
    public void save(Schedule schedule) {
        scheduleRepository.save(schedule);
    }

    @Override
    public Schedule findScheduleByShowID(Integer showID) {
        return scheduleRepository.findScheduleByShowID(showID);
    }
}
