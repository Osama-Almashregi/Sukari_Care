@extends('layouts.admin')
@section('content')
<div class="main-content-inner">

  <div class="main-content-wrap">
      <div class="tf-section-2 mb-30">
          <div class="flex gap20 flex-wrap-mobile">
              <div class="w-half">

                  <div class="wg-chart-default mb-20">
                      <div class="flex items-center justify-between">
                          <div class="flex items-center gap14">
                              <div class="image ic-bg">
                                  <i class="icon-users"></i>
                              </div>
                              <div>
                                  <div class="body-text mb-2">All doctors</div>
                                  @if($doctors==null)
                                  <h4>0</h4>
                                  @else
                                  <h4>{{$doctors}}</h4>
                                  @endif
                              </div>
                          </div>
                      </div>
                  </div>


                  <div class="wg-chart-default mb-20">
                      <div class="flex items-center justify-between">
                          <div class="flex items-center gap14">
                              <div class="image ic-bg">
                                  <i class="icon-users"></i>
                              </div>
                              <div>
                                  <div class="body-text mb-2">All Patients</div>
                                @if ($patients==null)
                                <h4>0</h4>
                                @else
                                <h4>{{$patients}}</h4>
                                @endif
                                </div>
                          </div>
                      </div>
                  </div>


                  <div class="wg-chart-default mb-20">
                      <div class="flex items-center justify-between">
                          <div class="flex items-center gap14">
                              <div class="image ic-bg">
                                  <i class="icon-book"></i>
                              </div>
                              <div>
                                  <div class="body-text mb-2">All Glucose Readers</div>
                                 @if ($glucose_readers==null)
                                 <h4>0</h4>
                                 @else
                                 <h4>{{$glucose_readers}}</h4>
                                 
                                 @endif
                              </div>
                          </div>
                      </div>
                  </div>


                  <div class="wg-chart-default">
                      <div class="flex items-center justify-between">
                          <div class="flex items-center gap14">
                              <div class="image ic-bg">
                                  <i class="icon-book-open"></i>
                              </div>
                              <div>
                                  <div class="body-text mb-2">all_Recommendations</div>
                                @if ($all_Recommendations==null)
                                <h4>0</h4>
                                @else
                                <h4>{{$all_Recommendations}}</h4>
                                
                                @endif
                                </div>
                          </div>
                      </div>
                  </div>

              </div>

              <div class="w-half">

                  <div class="wg-chart-default mb-20">
                      <div class="flex items-center justify-between">
                          <div class="flex items-center gap14">
                              <div class="image ic-bg">
                                  <i class="icon-users"></i>
                              </div>
                              <div>
                                  <div class="body-text mb-2">All Users</div>
                                 @if ($users==null)
                                 <h4>0</h4>
                                 @else
                                 <h4>{{$users}}</h4>
                                 
                                 @endif
                              </div>
                          </div>
                      </div>
                  </div>


                  <div class="wg-chart-default mb-20">
                      <div class="flex items-center justify-between">
                          <div class="flex items-center gap14">
                              <div class="image ic-bg">
                                  <i class="icon-layers"></i>
                              </div>
                              <div>
                                  <div class="body-text mb-2">All Blogs</div>
                                  @if ($blogs==null)
                                  <h4>0</h4>
                                  @else 
                                  <h4>{{$blogs}}</h4>
                                  
                                  @endif
                              </div>
                          </div>
                      </div>
                  </div>


                  <div class="wg-chart-default mb-20">
                      <div class="flex items-center justify-between">
                          <div class="flex items-center gap14">
                              <div class="image ic-bg">
                                  <i class="icon-bar-chart"></i>
                              </div>
                              <div>
                                  <div class="body-text mb-2">All Blood Tests</div>
                                @if ($all_blood_tests==null)    
                                <h4>0</h4>
                                @else
                                <h4>{{$all_blood_tests}}</h4>
                                
                                @endif
                                </div>
                          </div>
                      </div>
                  </div>


                  <div class="wg-chart-default">
                      <div class="flex items-center justify-between">
                          <div class="flex items-center gap14">
                              <div class="image ic-bg">
                                  <i class="icon-user-plus"></i>
                              </div>
                              <div>
                                  <div class="body-text mb-2">All Relatives</div>
                                  @if ($all_relatives==null)
                                  <h4>0</h4>    
                                  @else
                                  <h4>{{$all_relatives}}</h4>
                                  
                                  @endif
                              </div>
                          </div>
                      </div>
                  </div>

              </div>

          </div>
<div class="wg-box">
    <div class="flex items-center justify-between">
        <h5>{{$chart1->options['chart_title']}}</h5>
        <div class="dropdown default">
            <button class="btn btn-secondary dropdown-toggle" type="button"
                data-bs-toggle="dropdown" aria-haspopup="true"
                aria-expanded="false">
                <span class="icon-more"><i class="icon-more-horizontal"></i></span>
            </button>
            <ul class="dropdown-menu dropdown-menu-end">
                <li>
                    <a href="javascript:void(0);" id="thisWeek">This Week</a>
                </li>
                <li>
                    <a href="javascript:void(0);" id="lastWeek">Last Week</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="flex flex-wrap gap40">
        <div>
            <div class="mb-2">
                <div class="block-legend">
                    <div class="dot t1"></div>
                    <div class="text-tiny">Revenue</div>
                </div>
            </div>
            <div class="flex items-center gap10">
                <h4>$37,802</h4>
                <div class="box-icon-trending up">
                    <i class="icon-trending-up"></i>
                    <div class="body-title number">0.56%</div>
                </div>
            </div>
        </div>
        <div>
            <div class="mb-2">
                <div class="block-legend">
                    <div class="dot t2"></div>
                    <div class="text-tiny">Order</div>
                </div>
            </div>
            <div class="flex items-center gap10">
                <h4>$28,305</h4>
                <div class="box-icon-trending up">
                    <i class="icon-trending-up"></i>
                    <div class="body-title number">0.56%</div>
                </div>
            </div>
        </div>
    </div>
    <div>
        {!! $chart1->renderHtml() !!}
    </div>
</div>


      </div>
      <div class="tf-section mb-30">

          <div class="wg-box">
              <div class="flex items-center justify-between">
                  <h5>Recent Glucose Readers</h5>
                  <div class="dropdown default">
                      <a class="btn btn-secondary dropdown-toggle" href="#">
                          <span class="view-all">View all</span>
                      </a>
                  </div>
              </div>
              <div class="wg-table table-all-user">
                  <div class="table-responsive">
                      <table class="table table-striped table-bordered">
                          <thead>
                              <tr>
                                  <th style="width: 80px">ID</th>
                                  <th>Patient name</th>
                                  <th class="text-center">Doctor Name</th>
                                  <th class="text-center">Reading Value</th>    
                          </tr>
                          </thead>
                          <tbody>
                            @foreach ($recent_glucose_readers as $glucose_reader )
                            
                            <tr>
                                <td class="text-center">{{$glucose_reader['glucose_reading_id']}}</td>
                                <td class="text-center">{{$glucose_reader['patient_name']}}</td>
                                <td class="text-center">{{$glucose_reader['doctor_name']}}</td>
                                <td class="text-center">
                                    @if ($glucose_reader['glucose_reading_value']>=80 && $glucose_reader['glucose_reading_value']<=120)
                                    <span class="text-success text-bold"><i class="icon-check text-success"></i> {{$glucose_reader['glucose_reading_value']}}</span>
                                    @elseif ($glucose_reader['glucose_reading_value']<80)
<span class="text-bold text-warning"><i class="icon-arrow-down text-warning"></i> {{$glucose_reader['glucose_reading_value']}}</span>                                    @elseif ($glucose_reader['glucose_reading_value']>120)
                                    <span class="text-danger text-bold"><i class="icon-arrow-up text-danger"></i> {{$glucose_reader['glucose_reading_value']}}</span>
                                    @endif
                                </td>
                               
                                <td class="text-center">
                                   {{$glucose_reader['glucose_reading_date']}}
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                    <div class="flex justify-center">

                        {{ $recent_glucose_reader->links('pagination::bootstrap-5') }}
                    </div>
                      
                  </div>
              </div>
          </div>

      </div>
  </div>

</div>
    {!! $chart1->renderChartJsLibrary() !!}
    {!! $chart1->renderJs() !!}
@endsection