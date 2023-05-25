package com.gdu.moovod.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class FQueryDTO {
  
  private String column;
  private String searchText;

}
