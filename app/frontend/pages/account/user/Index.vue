<template>
  <div class="row">
    <div class="col-xl-12 col-lg-12 col-md-12">
    <div class="card custom-card mg-b-20">
      <div class="card-body">
        <div class="card-header border-bottom-0 pt-0 px-0 pb-2 d-flex">
          <div>
            <label class="main-content-label mb-2">Tasks</label>
            <span class="d-block fs-12 mb-3 text-muted">A task is accomplished by a set deadline, and must
              contribute toward
              work-related objectives.</span>
          </div>
          <div class="ms-auto d-flex flex-wrap gap-2">
            <div class="contact-search3 me-3 ">
              <button type="button" class="btn border-0">
                <i class="fe fe-search fw-semibold text-muted" aria-hidden="true"></i>
              </button>
               <input type="text" class="form-control h-6" id="typehead1" placeholder="Search here..." autocomplete="off">
            </div>
            <div class="ms-auto d-flex dropdown">
              <a href="javascript:void(0);" class="btn dropdown-toggle btn-sm btn-wave waves-effect waves-light btn-primary d-inline-flex align-items-center" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="ri-equalizer-line me-1"></i>Sort by
              </a>
              <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1" style="">
                  <li><a class="dropdown-item" href="javascript:void(0);">Task</a></li>
                  <li><a class="dropdown-item" href="javascript:void(0);">Team</a></li>
                  <li><a class="dropdown-item" href="javascript:void(0);">Status</a></li>
                  <li class="dropdown-divider"></li>
                  <li>
                    <a class="dropdown-item" href="javascript:void(0);">
                      <i class="fa fa-cog me-2"></i>Settings
                    </a>
                  </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="table-responsive tasks">
          <table class="table card-table table-vcenter text-nowrap mb-0 border">
            <thead>
              <tr>
                <th class="wd-lg-10p">Task</th>
                <th class="wd-lg-20p text-center">Team</th>
                <th class="wd-lg-20p text-center">Open task</th>
                <th class="wd-lg-20p">Priority</th>
                <th class="wd-lg-20p">Status</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="fw-medium">
                  <div class="form-check">
                    <input checked="" type="checkbox" class="form-check-input me-4 rounded">
                    <label class="form-check-label">Evaluating the design</label>
                  </div>
                </td>
                <td class="text-nowrap">
                  <div class="avatar-list-stacked my-auto float-end">
                    <div class="avatar-sm avatar avatar">
                      <img alt="avatar" class="rounded-circle" src="../../../images/template/faces/1.jpg" />
                    </div>
                    <div class="avatar-sm avatar avatar">
                      <img alt="avatar" class="rounded-circle" src="../../../images/template/faces/2.jpg" />
                    </div>
                    <div class="avatar-sm avatar avatar">
                      <img alt="avatar" class="rounded-circle" src="../../../images/template/faces/3.jpg" />
                    </div>
                    <div class="avatar-sm avatar avatar">
                      <img alt="avatar" class="rounded-circle" src="../../../images/template/faces/4.jpg" />
                    </div>
                  </div>
                </td>
                <td class="text-center">37<i class=""></i></td>
                <td class="text-primary">High</td>
                <td>
                  <span class="badge bg-pill rounded-pill bg-primary-transparent">Completed</span>
                </td>
              </tr>
              <tr>
                <td class="fw-medium">
                  <div class="form-check">
                    <input type="checkbox" class="form-check-input me-4 rounded">
                    <label class="form-check-label">Generate ideas for design</label>
                  </div>
                </td>
                <td class="text-nowrap">
                  <div class="avatar-list-stacked my-auto float-end">
                    <div class="avatar-sm avatar">
                      <img alt="avatar" class="rounded-circle" src="../../../images/template/faces/5.jpg" />
                    </div>
                    <div class="avatar-sm avatar">
                      <img alt="avatar" class="rounded-circle" src="../../../images/template/faces/6.jpg" />
                    </div>
                    <div class="avatar-sm avatar">
                      <img alt="avatar" class="rounded-circle" src="../../../images/template/faces/7.jpg" />
                    </div>
                    <div class="avatar-sm avatar">
                      <img alt="avatar" class="rounded-circle" src="../../../images/template/faces/8.jpg" />
                    </div>
                  </div>
                </td>
                <td class="text-center">37<i class=""></i></td>
                <td class="text-secondary">Normal</td>
                <td>
                  <span class="badge bg-pill rounded-pill bg-warning-transparent">Pending</span>
                </td>
              </tr>
              <tr>
                <td class="fw-medium">
                  <div class="form-check">
                    <input checked="" type="checkbox" class="form-check-input me-4 rounded">
                    <label class="form-check-label">Define the problem</label>
                  </div>
                </td>
                <td class="text-nowrap">
                  <div class="avatar-list-stacked my-auto float-end">
                    <div class="avatar-sm avatar">
                      <img alt="avatar" class="rounded-circle" src="../../../images/template/faces/11.jpg" />
                    </div>
                    <div class="avatar-sm avatar">
                      <img alt="avatar" class="rounded-circle" src="../../../images/template/faces/12.jpg" />
                    </div>
                    <div class="avatar-sm avatar">
                      <img alt="avatar" class="rounded-circle" src="../../../images/template/faces/9.jpg" />
                    </div>
                    <div class="avatar-sm avatar">
                      <img alt="avatar" class="rounded-circle" src="../../../images/template/faces/10.jpg" />
                    </div>
                  </div>
                </td>
                <td class="text-center">37<i class=""></i></td>
                <td class="text-warning">Low</td>
                <td>
                  <span class="badge bg-pill rounded-pill bg-primary-transparent">Completed</span>
                </td>
              </tr>
              <tr>
                <td class="fw-medium">
                  <div class="form-check">
                    <input type="checkbox" class="form-check-input me-4 rounded">
                    <label class="form-check-label">Empathize with users</label>
                  </div>
                </td>
                <td class="text-nowrap">
                  <div class="avatar-list-stacked my-auto float-end">
                    <div class="avatar-sm avatar">
                      <img alt="avatar" class="rounded-circle" src="../../../images/template/faces/7.jpg" />
                    </div>
                    <div class="avatar-sm avatar">
                      <img alt="avatar" class="rounded-circle" src="../../../images/template/faces/9.jpg" />
                    </div>
                    <div class="avatar-sm avatar">
                      <img alt="avatar" class="rounded-circle" src="../../../images/template/faces/11.jpg" />
                    </div>
                    <div class="avatar-sm avatar">
                      <img alt="avatar" class="rounded-circle" src="../../../images/template/faces/12.jpg" />
                    </div>
                  </div>
                </td>
                <td class="text-center">37<i class=""></i></td>
                <td class="text-primary">High</td>
                <td>
                  <span class="badge bg-pill rounded-pill bg-danger-transparent">Rejected</span>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="float-end mt-3">
          <nav aria-label="Page navigation" class="pagination-style-3">
            <ul class="pagination mb-0 flex-wrap">
              <li class="page-item disabled">
                <a class="page-link" href="javascript:void(0);">
                  Prev
                </a>
              </li>
              <li class="page-item active"><a class="page-link" href="javascript:void(0);">1</a></li>
              <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
              <li class="page-item">
                <a class="page-link" href="javascript:void(0);">
                  <i class="bi bi-three-dots"></i>
                </a>
              </li>
              <li class="page-item"><a class="page-link" href="javascript:void(0);">16</a></li>
              <li class="page-item">
                <a class="page-link text-primary" href="javascript:void(0);">
                  next
                </a>
              </li>
            </ul>
          </nav>
        </div>
      </div>
    </div>
    </div>
  </div>
</template>

<script>
export default {

}
</script>

<style>
</style>
