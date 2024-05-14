<template>
  <Pageheader heading="顧客詳細" :maintitle='["Top", "顧客管理", "顧客詳細"]'></Pageheader>


  <div class="row row-sm">
    <div class="col-xl-3 col-lg-12 col-md-12">
      <div class="card custom-card">
        <div class="card-body text-center item-user">
          <div class="profile-pic">
            <div class="profile-pic-img">
              <span class="bg-success dots" data-bs-toggle="tooltip" data-bs-placement="top" title="online"></span>
              <img src="../../../images/template/faces/1.jpg" class="rounded-circle" alt="user" />
            </div>
            <a href="javascript:;" class="text-dark">
              <h5 class="mt-3 mb-0 fw-semibold">試験太郎</h5>
            </a>
          </div>
        </div>

        <div class="">
          <div class="panel panel-primary tabs-style-4">
            <div class="tab-menu-heading w-100">
              <div class="tabs-menu">
                <!-- Tabs -->
                <ul class="item1-links nav nav-tabs mb-0">
                  <li class="nav-item">
                    <a href="#basic" class="nav-link active" data-bs-toggle="tab">
                      <i class="ti-user icon1 float-start"></i>基本情報</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#rank" data-bs-toggle="tab">
                      <i class="ti-save-alt icon1 float-start"></i>ランク情報</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#point" data-bs-toggle="tab">
                      <i class="ti-truck icon1 float-start"></i>ポイント情報</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#payment" data-bs-toggle="tab">
                      <i class="ti-heart icon1 float-start"></i>支払い情報</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#checkin" data-bs-toggle="tab">
                      <i class="ti-wallet icon1 float-start"></i>チェックイン情報</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#reservation" data-bs-toggle="tab">
                      <i class="ti-credit-card icon1 float-start"></i>予約情報</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#survey" data-bs-toggle="tab">
                      <i class="ti-credit-card icon1 float-start"></i>アンケート情報</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="#ticket" data-bs-toggle="tab">
                      <i class="ti-credit-card icon1 float-start"></i>回数券情報</a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-xl-9 col-lg-12 col-md-12">
      <div class="card custom-card">
        <div class="card-body">
          <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active p-0" id="basic" role="tabpanel">
              1
            </div>

            <div class="tab-pane fade p-0" id="rank" role="tabpanel">
              2
            </div>

            <div class="tab-pane fade p-0" id="point" role="tabpanel">
              3
            </div>

            <div class="tab-pane fade p-0" id="payment" role="tabpanel">
              4
            </div>

            <div class="tab-pane fade p-0" id="checkin" role="tabpanel">
              5
            </div>

            <div class="tab-pane fade p-0" id="reservation" role="tabpanel">
              6
            </div>

            <div class="tab-pane fade p-0" id="survey" role="tabpanel">
              7
            </div>

            <div class="tab-pane fade p-0" id="ticket" role="tabpanel">
              8
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Pageheader from "../../../components/shared/pageheader/pageheader.vue"
export default {
  components: { Pageheader },
  data() {
    return {
      url: import.meta.env.BASE_URL,
      countryValue: null,
      countryOptions: ["India", "USA", "UK", "UAE"],

      languageValue: null,
      languageOptions: ["English", "English (United States)", "English UK", "Arabic"],
    }
  },

}
</script>

<style scoped></style>
