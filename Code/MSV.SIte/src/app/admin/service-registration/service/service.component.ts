import { Component, OnInit, Input, SimpleChanges, OnChanges } from '@angular/core';
import { BsModalService, defineLocale, BsLocaleService, ptBrLocale } from 'ngx-bootstrap';
import { ManageAddressesComponent } from './modal/manage-addresses/manage-addresses.component';
import { PrecoServicoContrato } from 'src/app/shared/entities/preco-servico-contrato';
import { Frequencia } from 'src/app/shared/entities/frequencia';
import { PrecoFrequencia } from 'src/app/shared/entities/preco-frequencia';
import { FluxoOperacional } from 'src/app/shared/entities/operational-flow';

@Component({
  selector: 'app-service',
  templateUrl: './service.component.html',
  styleUrls: ['./service.component.scss']
})
export class ServiceComponent implements OnInit, OnChanges {
  @Input() precoServicoContrato: PrecoServicoContrato;
  @Input() fluxosOperacionais: FluxoOperacional[];

  a1: false;
  a2: false;
  a3: false;
  a4: false;
  dtVigenciaFim: Date;

  constructor(
    private modalService: BsModalService,
    private localeService: BsLocaleService) { }

  ngOnInit() {
    defineLocale('pt-br', ptBrLocale);
    this.localeService.use('pt-br');
  }

  ngOnChanges(changes: SimpleChanges): void {
    if (this.precoServicoContrato.dT_BASE !== undefined) {
      this.precoServicoContrato.dT_BASE = this.formatDate(this.precoServicoContrato.dT_BASE.toString());
    }

    if (this.precoServicoContrato.dT_VIGENCIAINICIO !== undefined) {
      this.precoServicoContrato.dT_VIGENCIAINICIO = this.formatDate(this.precoServicoContrato.dT_VIGENCIAINICIO.toString());
    }

    if (this.precoServicoContrato.dT_VIGENCIAFIM !== undefined) {
      this.precoServicoContrato.dT_VIGENCIAFIM = this.formatDate(this.precoServicoContrato.dT_VIGENCIAFIM.toString());
    }

    // this.selectElement('selectFluxoOperacional', this.precoServicoContrato.coD_FLUXO);
  }

  selectElement(id, valueToSelect) {
    const element = (document.getElementById(id) as HTMLSelectElement);
    element.value = valueToSelect;
  }

  public gerenciarEnderecos(): void {
    this.modalService.show(ManageAddressesComponent, { class: 'gray modal-lg' });
  }

  formatDate(date: string) {
    return new Date(date);
  }

  obterDescricaoFrequencia(precoFrequencia: PrecoFrequencia): string {
    return new Frequencia(precoFrequencia.frequencia.deS_Cronograma,
      precoFrequencia.frequencia.deS_Quinzena,
      precoFrequencia.frequencia.deS_DiasSemana,
      precoFrequencia.frequencia.deS_SemanasMes,
      // frequencia.deS_DiasMes,
      precoFrequencia.frequencia.deS_DiasUteis).descricao;
  }
}
