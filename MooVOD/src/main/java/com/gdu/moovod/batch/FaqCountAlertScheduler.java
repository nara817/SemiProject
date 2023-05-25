package com.gdu.moovod.batch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.gdu.moovod.service.FaqService;

public class FaqCountAlertScheduler {
  
  @Autowired
  private FaqService faqService;
  
  @Scheduled(cron="0 0/1 * * * ?")  // 크론식(1분마다)
  public void execute() {
    faqService.getFaqCount();
  }
  
  
}
