package com.gdu.moovod.batch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.gdu.moovod.service.NoticeService;

public class noticeCountAlertScheduler {
  
  @Autowired
  private NoticeService noticeService;
  
  @Scheduled(cron="0 0/1 * * * ?")  // 크론식(1분마다)
  public void execute() {
    noticeService.getNoticeCount();
  }
  
  
}
